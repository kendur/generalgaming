# SonosDeck — Plan (v2)

**Status:** Accepted 2026-10-29. Path A (Home Assistant) is delivered first, then Path B (standalone app).
**Date:** 2026-10-29
**Setup file:** [PROJECT.md](PROJECT.md)
**Working name:** SonosDeck. A public release must use a distinct name (§8).

---

## 1. Goal and constraints

**Goal**
- Control a Sonos system from a Steam Deck in **Desktop Mode**, docked to two large monitors with keyboard and mouse.
- Add Windows later.
- Get as close to the official Sonos app's features as third parties can.

**Constraints**
- Lightweight, with simple graphics.
- No root changes to SteamOS, and everything survives SteamOS updates.
- Game Mode, gamepad navigation and Decky plugins are **out of scope**.

**Environment** (details in PROJECT.md)
- QNAP NAS.
- One LAN.
- Spotify about 99% of listening, YouTube Music about 1%.

---

## 2. Research summary

Full source list is in §11.

### 2.1 Which Sonos interfaces a third party can use

| Interface | Status | Coverage | Verdict |
|---|---|---|---|
| **Local UPnP/SOAP, TCP 1400** | Sonos calls it "unsupported" and "no longer actively maintained" (S5, S6). Since firmware 85.0 (July 2025) a user can switch UPnP off. It is on by default; turning it off makes every SOAP and event call return HTTP 403 (S5, S7). | The only interface close to the official app: queue, library, alarms, EQ, home theater, playlists, favorites, rename, battery (S8). | **The foundation for both paths.** Detect 403 and explain the fix. |
| **Local WebSocket, TCP 1443** | Documented in passing, but "The Control API on the LAN is not available for wide release" (S3). Home Assistant and Music Assistant use it anyway (S9, S10). | Groups, playback, volume, audioClip (announcements), home theater. No queue, browse, alarms or EQ (S10). | Supplement only, for announcements. |
| **Cloud Control API** | Official. OAuth2 with a public HTTPS redirect URL, and events delivered by HTTPS webhook (S1, S2). | No queue, browse or search, EQ, alarms or sleep timer (S1). | **Not used.** |
| **SMAPI (music services)** | Built for Sonos players and Sonos's own apps; there is no sanctioned way for a third party to browse or search (S4). | The community workaround decrypts tokens stored on the speakers. SoCo PR #1010 implements it; the maintainer blocked it on 2026-10-13 over legal and security risk (S11, S12). | **Not used.** |

### 2.2 Official app inventory, 2024–2026

The 2024 redesign removed many features, and most came back during 2024–2026 (S13, S14):
- queue editing
- playlist editing
- alarms with snooze
- sleep timer
- music library
- save queue as playlist (2026-01-27)

The full inventory is the matrix in §5.

### 2.3 Spotify and YouTube Music

**Constraints found:**
- **No sanctioned way to browse the music services linked in your Sonos account** from third-party code (§2.1, SMAPI).
- **Spotify Developer Mode was tightened in February and March 2026** (S29):
  - Premium is required.
  - One developer client ID per person.
  - At most 5 users per client ID.
  - Fewer API endpoints. Reportedly the browse endpoints were removed and search returns at most 10 results.
- **Music Assistant's Spotify provider** has two playback engines (S17):
  - **librespot (the default community engine):** "Accounts created around December 2024 and later generally cannot play through librespot."
  - **Spotify Soloist:** the documented alternative. It "works with every Premium account", but "using it through Music Assistant is at your own risk."
  - Premium is required either way.
- **Home Assistant's Sonos integration plays Spotify natively.** When you pick Spotify media through a Sonos player in HA's media browser, HA converts it to a Spotify URI. The speaker then plays it through the Spotify account linked in the Sonos app; HA does not use Spotify Connect for this. Source: HA `sonos/media_browser.py` and `media_player.py` (S30).

**Music strategy, layered from most to least robust:**

| # | Route | Path A | Path B | Notes |
|---|---|---|---|---|
| 1 | **Sonos Favorites and Sonos Playlists** | Y | Y | Anything you favorite in the official app becomes one click here. Works for YouTube Music too. |
| 2 | **Spotify share links and URIs**, played natively on Sonos | Y (`play_media`) | Y (SoCo ShareLink) | Paste or drag a link from the Spotify app. |
| 3 | **Spotify desktop app** on the Deck (Flatpak), casting to Sonos through Spotify Connect | Complements HA | Complements the app | The best search and browse experience available to you. HA and the app then handle rooms, volume, EQ and grouping. Connect playback uses Spotify's queue, not the Sonos queue. |
| 4 | **HA Spotify integration** for browsing inside the dashboard, played natively through route 2 | Test in A2 | — | Needs your own Spotify developer app and Premium. Library and playlists should work; browse features may be gone (S29, S31). |
| 5 | **SpotifyPlus** (HACS) | Fallback in A2 | — | Richer Spotify API coverage. Sonos support uses SoCo and builds a local queue on the speaker, with known quirks (S32). |
| 6 | **Music Assistant** with the Spotify provider | Optional; test in A2 | — | Needed for the Sonos Card's Search section. Newer accounts need the Soloist engine (at your own risk, S17). |

### 2.4 Prior art

| Project | State | Takeaway |
|---|---|---|
| noson (Qt, Linux) | Flathub: "This application is no longer available on Flathub… does no longer work as flatpak package" (S18) | The best Linux controller is effectively gone from SteamOS. |
| Sonos web app (play.sonos.com) | Basic: grouping, playback, queue view, no settings (S19) | A stopgap until Path A is running. |
| Home Assistant Sonos integration | Core integration built on SoCo 0.31.5 and sonos-websocket 0.2.0. Handles fallback when events stop arriving, resubscription and favorites playback (S9, S22) | Already solves most of the hard engineering. |
| Sonos Card (HACS) | Auto-discovers Sonos players. Sections: player, groups, grouping, volumes, media browser, queue (show, play, rearrange), search (needs Music Assistant), sleep timer. Can be split into several card instances (S23) | Covers the official app's main screens. |

### 2.5 Distribution policy constraints (verified)

- **Flathub** (S25):
  - "Flathub manifests must not contain AI-generated or AI-assisted content."
  - "AI tools or agents must not open or automate Flathub submission pull requests."
  - "Official affiliation must not be implied by using a vendor's name in the application name or icon."
  - So the Path B Flatpak will be **self-hosted** as a `.flatpak` bundle on GitHub Releases.
- **Decky store** (S24) requires the checkbox "Generative AI was NOT used to write a majority of the code". This no longer matters, since Decky plugins only work in Game Mode, which is out of scope.

---

## 3. Architecture

### Path A — Home Assistant on the QNAP (phase 1)

```
 Steam Deck — Desktop Mode (KDE)                    Windows PC (later)
 ┌──────────────────────────────────────┐          ┌────────────────────┐
 │ Monitor 1/2: "SonosDeck" app window  │          │ Edge --app window  │
 │   (Chromium --app, kiosk dashboard)  │          └─────────┬──────────┘
 │ Pop-out: "SonosDeck Mini" window     │                    │
 │ Spotify desktop app (Connect)        │                    │
 └──────────────────┬───────────────────┘                    │
                    └──────────── HTTP / WebSocket ──────────┘
                                   │
               ┌───────────────────▼────────────────────┐
               │ QNAP: Home Assistant                   │
               │  (HAOS VM in Virtualization Station,   │
               │   or Container Station, host network)  │
               │  • Sonos integration (core)            │──UPnP 1400 / WS 1443──► Sonos
               │  • Spotify integration (test in A2)    │
               │  • HACS: Sonos Card, kiosk-mode,       │
               │    auto-entities                       │
               │  • sonos_extras (ours, if needed)      │
               └────────────────────────────────────────┘
```

**Install-type decision for the QNAP** (made in A0 from facts about the NAS):

| Condition | Choice | Why |
|---|---|---|
| x86-64 CPU, Virtualization Station available, 8 GB or more RAM in the NAS | **Home Assistant OS VM.** Recommended. | Full add-on store, the simplest upgrades, and the same setup as a future dedicated box. A backup restores directly there (S26). |
| ARM CPU, or tight on RAM | **Container Station** with `network_mode: host` | Lighter. No add-on store, so HACS and optional add-ons run as separate containers (S33, S34). |

**Sizing**
- Your rule is to size for 85% capacity. HA plus a few integrations normally uses about 1–2 GB of RAM.
- A **4 GB, 2 vCPU, 32 GB** VM keeps expected load well under 85%.
- HA documents 2 GB of RAM and 2 vCPUs as the VM minimum (S35).
- The KVM image is a `.qcow2` that needs UEFI firmware without Secure Boot, attached to a bridged network (S35).
- 32 GB is the image's default disk size.

### Path B — standalone desktop app (phase 2)

```
 ┌──────────────── SonosDeck app (Python 3.12, Flatpak) ───────────────┐
 │ ui/      PySide6 (Qt Widgets): main window, mini-player, tray icon  │
 │ desktop/ MPRIS2 D-Bus service → KDE media widget + media keys       │
 │ core/    SoCo 0.32 run in a worker pool; state store                │
 │          discovery chain • topology • event manager + watchdog      │
 │          resume handler • UPnP-off (403) detector                   │
 │ extras/  sonos-websocket (announcements, optional)                  │
 └──────────────────────────────────────────────────────────────────────┘
```

**What changed from v1**
- **Toolkit is now PySide6 (Qt Widgets), not pygame-ce.**
  - Without Game Mode, pygame-ce's advantages no longer apply: gamepad support and Steam's on-screen keyboard.
  - Qt Widgets gives a native KDE look, resizable multi-monitor windows, a tray icon and an excellent Windows port.
  - Cost: the shared Flathub KDE runtime with PySide6 (`io.qt.PySide.BaseApp`, about 0.3 GB download; S28). It is shared with other KDE and Qt apps.
- **MPRIS2 support is new.** It plugs Sonos into KDE's media widget, the lock screen and your keyboard's media keys. Path A cannot do this.

**Decision gate at B0: standalone, or a client of Home Assistant?**
- **Recommendation: standalone (SoCo direct).** Not depending on the NAS is the main reason to build an app once HA exists.
- An HA client would be simpler, but it would duplicate what the dashboard already does.

**Path B builds what HA already has**
- Subscription watchdog, and resubscribe after resume.
- Discovery chain: SSDP → mDNS → cached IPs → subnet scan → manual IP.
- 403 detection when UPnP is off.
- Favorites playback logic.
- Polling fallback when the firewall blocks events.
- Browse paging (at most 1,000 items per call).

---

## 4. UX design (desktop)

- **Main window ("SonosDeck")**
  - Three columns: **Rooms and grouping** | **Now Playing** | **Queue and Browse**.
  - Scales from 1280 px to 4K widths.
  - Settings view per room: EQ, home theater, alarms, sleep timer, status light, touch lock, battery.
- **Pop-out mini-player ("SonosDeck Mini")**
  - A small separate window with now playing, transport controls, group volume and per-room volume.
  - A KDE window rule keeps it on top and places it on whichever monitor you choose.
- **Look:** dark theme, flat shapes plus album art, no animation beyond simple transitions.
- **Input:** keyboard and mouse.
  - Path A uses browser defaults.
  - Path B adds shortcuts (Space for play/pause, Ctrl+↑/↓ for volume, Ctrl+1–3 for columns) and media keys through MPRIS.

---

## 5. Feature coverage matrix

Key: Y = yes · P = partial · N = no · ? = verify during the build · OOS = out of scope.

| Feature | Official app | Path A (HA + Sonos Card + sonos_extras) | Path B (standalone) |
|---|---|---|---|
| List rooms; group, ungroup, preset groups | Y | Y | Y |
| Group volume, per-room volume, mute | Y | Y | Y |
| Play, pause, skip, seek; now playing with art | Y | Y | Y |
| Shuffle, repeat, crossfade | Y | Y | Y |
| Queue: view, play from position, remove | Y | Y (`get_queue`, `play_queue`, `remove_from_queue`) | Y |
| Queue: reorder, clear | Y | P (Sonos Card reorder; clear through sonos_extras) ? | Y |
| Save queue as Sonos playlist | Y | sonos_extras | Y |
| Sonos Favorites: play | Y | Y | Y |
| Sonos Favorites: add, remove, rename | Y | sonos_extras | Y (SoCo 0.32) |
| Sonos Playlists: play | Y | Y | Y |
| Sonos Playlists: create, edit | Y | sonos_extras | Y |
| Local music library: browse, search | Y | Y (media browser, `search_media`) | Y |
| Local music library: reindex | Y | sonos_extras | Y |
| Spotify: browse your library and playlists | Y | P (HA Spotify integration, test in A2) | P (Spotify Web API, optional) |
| Spotify: search | Y | P (Spotify app via Connect; Music Assistant if eligible) | P (Spotify app via Connect) |
| Spotify: play a link or URI natively | (share sheet) | Y | Y |
| YouTube Music | Y | P (Sonos Favorites) | P (Sonos Favorites) |
| Line-in and TV input | Y | Y | Y |
| Alarms: enable, disable, edit | Y | Y (switches, `update_alarm`) | Y |
| Alarms: create, delete | Y | sonos_extras | Y |
| Sleep timer | Y | Y | Y |
| Bass, treble, loudness | Y | Y | Y |
| Balance | Y | ? | Y |
| Night Sound, Speech Enhancement, dialog level | Y | Y | Y |
| Sub on, gain, crossover; surround levels; full/ambient | Y | Y | Y |
| Lip sync (audio delay), TV Autoplay | Y | Y (Autoplay is polled) | Y |
| Status light, touch controls | Y | Y | Y |
| Battery level and power state (Roam, Move) | Y | Y | Y (S2) |
| Rename room | Y | sonos_extras | Y |
| Volume limit | Y | ? | ? |
| Software update: check | Y | sonos_extras (check only) | Y (check only) |
| Announcements / TTS | (Voice only) | Y (port 1443) | P (optional) |
| KDE media widget, lock screen, media keys | N | N | Y (MPRIS2) |
| Remote control away from home | Y | Y (HA remote access) | N (LAN only) |
| Automations | Partial (alarms) | Y | N |
| Stereo pair, surround and sub bonding | Y | OOS | OOS (Sonos restricts this to user-initiated setup) |
| Trueplay tuning | Y (iOS mic or Quick Tuning) | OOS (on/off only) | OOS (on/off only) |
| Setup, Wi-Fi, SonosNet, voice assistants, AirPlay, account | Y | OOS | OOS |

---

## 6. Phased delivery

Each phase ends with an acceptance check run on the Deck in Desktop Mode.

**Every NAS-side step needs a session that can reach the LAN.** That means either:
- a local Claude Code session on a computer on the LAN, or
- this cloud session attached through Remote Control to a Linux or Mac folder. The Deck itself qualifies.

### Path A — Home Assistant (now)

| Phase | Deliverable | Acceptance |
|---|---|---|
| **A0 Access and inventory** | A LAN-capable session reads the QNAP docs (PROJECT.md). Then it records: QNAP model, CPU architecture, RAM, free disk, QTS version, Container Station and Virtualization Station availability. Discover speakers (names, models, S1/S2, firmware, IPs); check UPnP is on (a SOAP call must not return 403); add DHCP reservations. Choose the install type (§3). | PROJECT.md environment table filled in; install type chosen |
| **A1 HA core** | Install HA per `ha/README.md`. Add the Sonos integration and HACS. Set up encrypted backups and store the key offline. Fill in `ha/VERSIONS.md`. | Every room appears; the entities in §5 are present; a backup restore has been tested |
| **A2 Spotify routes** | Test routes 1–6 from §2.3, in order. Keep what works; record the results in `ha/README.md`. | Favorites, share links and at least one way to browse inside the dashboard work |
| **A3 Dashboard** | Import `ha/dashboards/sonosdeck.yaml`: main view (three columns), mini view and settings view. Install kiosk-mode, the Sonos Card and auto-entities. | Every §4 screen works with the mouse at the monitors' resolution |
| **A4 Launchers** | `launchers/deck/` (KDE app windows plus window rules) and `launchers/windows/` (Edge `--app`) | The main and mini windows open from the KDE launcher with no browser chrome, on the chosen monitors |
| **A5 sonos_extras** | A small HA custom integration (Python, using HA's own SoCo), only for gaps A1–A3 confirm: save queue, create/delete alarms, edit playlists and favorites, rename rooms, reindex, update check. Dashboard buttons wired to it. | Every "sonos_extras" row in §5 works |

### Path B — standalone app (after Path A is in use)

| Phase | Deliverable | Acceptance |
|---|---|---|
| **B0 Decision gate and spikes** | Confirm standalone versus HA client (§3). Flatpak bundle skeleton; SSDP and event callbacks inside the Flatpak sandbox; MPRIS2 visible to KDE; SteamOS firewall state. | All spikes pass on the Deck, or there is a documented workaround |
| **B1 Core** | Discovery chain, topology and state store, event manager with watchdog, resume handler, 403 detection, recorded-fixture tests | Tests pass; the state stays accurate across sleep and resume |
| **B2 Windows and play** | Main window, mini-player, tray; Now Playing, rooms and grouping, volume | §5 rows from rooms/grouping through shuffle/repeat/crossfade |
| **B3 Content** | Queue, favorites, playlists, library, share links, optional Spotify Web API | §5 rows from queue through YouTube Music |
| **B4 Settings** | EQ, home theater, alarms, sleep timer, light, lock, battery, rename, update check | §5 rows from alarms through software update |
| **B5 Desktop integration** | MPRIS2, media keys, autostart option | Playback is controllable from the KDE media widget and keyboard keys |
| **B6 Windows** | PyInstaller onedir build and installer firewall rule; System Media Transport Controls (SMTC, the Windows equivalent of MPRIS) as a stretch goal | Discovery and events work on Windows |

---

## 7. Risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Sonos turns off or removes UPnP on port 1400 | Both paths lose most features | Detect 403 and show the fix. HA tracks upstream changes. The port-1443 WebSocket still covers basic control. |
| No sanctioned way to browse music services | Weaker in-app Spotify search | The layered strategy in §2.3, with the Spotify app plus Connect as the primary search |
| Spotify API restrictions (2026); librespot failing on newer accounts | The HA Spotify integration or Music Assistant may be limited | Test in A2; keep routes 1–3, which need no Spotify developer app |
| QNAP resources or architecture | Can't run an HA OS VM | Fall back to Container Station (§3) |
| QNAP networking: Virtual Switch in NAT mode, QuFirewall | Discovery fails or events don't arrive | Bridged virtual switch for the VM, or host network for the container. Allow TCP 1400–1499 inbound from the LAN. HA falls back to polling. |
| HACS card breakage (A) | The dashboard regresses after HA updates | Pin versions, keep the YAML in git, update deliberately |
| NAS downtime (A) | No control through HA | Path B app (later), the official app, or play.sonos.com |
| Network segmented later (VLANs) | SSDP and mDNS no longer cross subnets | mDNS/SSDP reflector, or HA `hosts:` with static speaker IPs; Path B gets manual IPs and subnet scan |
| Sleep, resume and IP change (B) | Subscriptions are lost | Detect resume, then rediscover and resubscribe |
| Sonos trademark in the name | Takedown or rejection | Distinct public name (§8) |

---

## 8. Naming

"SonosDeck" is a working name for this private repo only. A public build must not imply affiliation with Sonos in its name or icon (S25).

---

## 9. Project setup file

Created and approved: [PROJECT.md](PROJECT.md).

---

## 10. Open items

1. **LAN access** for A0 and later phases (§6): a local Claude Code session, or Remote Control from the Deck or another Linux or Mac machine.
2. **Where the QNAP docs live** (`CLAUDE.md`, `.claude/QNAP_ACCESS.md`, `.claude/QNAP_CLAUDE.md`). A0 reads them before doing anything on the NAS.
3. **QNAP model, CPU architecture and RAM.** A0 collects these if not provided.
4. **Spotify Premium:** yes or no? Needed for the HA Spotify integration's playback control and for a Spotify developer app (S29, S31).
5. **Speaker inventory and S1 vs S2.** A0 discovers this from the LAN.

---

## 11. Sources

**Sonos official**
- S1. Control API index — https://docs.sonos.com/llms.txt ; https://docs.sonos.com/docs/control
- S2. Authorization and subscriptions — https://docs.sonos.com/docs/authorize ; https://docs.sonos.com/docs/subscribe
- S3. Connected-home architecture — https://docs.sonos.com/docs/connected-home-architecture
- S4. SMAPI — https://docs.sonos.com/docs/smapi
- S5. Connection Security — https://support.sonos.com/en-us/article/adjust-connection-security-settings
- S6. Sonos community: player update (UPnP "no longer actively maintained") — https://en.community.sonos.com/product-updates/a-new-player-update-is-live-6930092
- S13. App release notes — https://support.sonos.com/en-us/article/release-notes-sonos-app-updates
- S14. 2024 app roadmap — https://www.sonos.com/en/blog/update-on-the-sonos-app
- S15. Security advisory SSA-2025-0002 — https://www.sonos.com/security-advisory-2025-0002
- S19. App requirements and web app — https://support.sonos.com/en/article/sonos-app-requirements

**Community and GitHub**
- S7. HA 403 reports — https://github.com/home-assistant/core/issues/154877
- S8. svrooij Sonos UPnP docs — https://sonos.svrooij.io/services/
- S9. HA Sonos integration — https://www.home-assistant.io/integrations/sonos/ ; manifest: https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/manifest.json
- S10. aiosonos and sonos-websocket — https://pypi.org/project/aiosonos/ ; https://github.com/jjlawren/sonos-websocket
- S11. SoCo music services — https://github.com/SoCo/SoCo/issues/557
- S12. SoCo PR #1010 (blocked) — https://github.com/SoCo/SoCo/pull/1010
- S16. SoCo — https://pypi.org/project/soco/ ; https://github.com/SoCo/SoCo/releases/tag/v0.32.0
- S17. Music Assistant: Sonos — https://www.music-assistant.io/player-support/sonos/ ; Spotify provider — https://music-assistant.io/music-providers/spotify
- S18. noson on Flathub — https://flathub.org/apps/io.github.janbar.noson
- S22. HA Sonos internals — https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/speaker.py
- S23. Sonos Card — https://github.com/punxaphil/custom-sonos-card ; https://community.home-assistant.io/t/dashboard-sonos-card/393620
- S27. kiosk-mode — https://github.com/NemesisRE/kiosk-mode
- S30. HA Sonos Spotify handling — https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/media_browser.py ; https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/media_player.py
- S31. HA Spotify integration — https://www.home-assistant.io/integrations/spotify/ ; Spotify community, home-automation thread — https://community.spotify.com/t5/Spotify-for-Developers/Spotify-in-Home-Automation/m-p/7000973/highlight/true
- S32. SpotifyPlus — https://community.home-assistant.io/t/spotifyplus-integration/698651 ; https://newreleases.io/project/github/thlucas1/homeassistantcomponent_spotifyplus/release/v1.0.41
- S33. QNAP: Container Station vs Virtualization Station — https://community.home-assistant.io/t/qnap-container-station-or-virtualization-station-install/509179 ; https://community.home-assistant.io/t/home-assistant-os-install-on-qnap-nas/523656

**Platform**
- S24. Decky submission template — https://github.com/SteamDeckHomebrew/decky-plugin-database (.github/PULL_REQUEST_TEMPLATE/plugin_addition.md)
- S25. Flathub requirements — https://docs.flathub.org/docs/for-app-authors/requirements
- S26. HA 2025.1 backup restore — https://home-assistant.io/blog/2025/01/03/release-20251/
- S28. Toolkit references — Flathub runtime sizes: https://flathub.org/api/v2/summary/io.qt.PySide.BaseApp ; Flatpak permissions: https://docs.flatpak.org/en/latest/sandbox-permissions.html ; Windows Firewall: https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/rules
- S29. Spotify Developer Mode changes (2026) — https://techcrunch.com/2026/02/06/spotify-changes-developer-mode-api-to-require-premium-accounts-limits-test-users/ ; https://www.techzine.eu/news/devops/138608/spotify-puts-the-brakes-on-developer-mode-with-stricter-api-rules/
- S34. HA Container install (compose) — https://www.home-assistant.io/installation/linux
- S35. HA VM requirements (2 GB RAM, 2 vCPU, UEFI, bridged network) — https://www.home-assistant.io/installation/linux
