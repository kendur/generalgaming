# SonosDeck — Plan (v1, awaiting approval)

**Status:** Proposed. No application code will be written until this plan is accepted.
**Date:** 2026-10-29
**Working name:** SonosDeck. A public release must use a distinct name; see §8.

---

## 1. Goal and constraints

**Goal**
- Control a Sonos system from a Steam Deck, in both Desktop Mode and Game Mode.
- Add Windows later.
- Reach as close to feature parity with the official Sonos app as third-party access allows.

**Constraints**
- Lightweight, with simple graphics.
- Runs without root changes to SteamOS.
- Survives SteamOS updates.
- Usable with touch, trackpad and gamepad.

**Assumptions to confirm (§10)**
- The system is S2 rather than S1.
- The Deck and the speakers share one subnet or VLAN.
- UPnP is enabled in Sonos Connection Security, which is the default.

---

## 2. Research summary

Full source list in §11.

### 2.1 Which Sonos interfaces a third party can use

| Interface | Status | Coverage | Verdict |
|---|---|---|---|
| **Local UPnP/SOAP, TCP 1400** | Sonos calls it "unsupported" and "no longer actively maintained" (S5, S6). Since firmware 85.0 (July 2025) a user can switch UPnP off. It is on by default, and turning it off makes every SOAP or event call return HTTP 403 (S5, S7). | The only interface near parity: queue, library, alarms, EQ, home theater, playlists, favorites, rename, battery (S8). | **Foundation for both paths.** Detect 403 and explain the fix to the user. |
| **Local WebSocket, TCP 1443** | Documented in passing, but "The Control API on the LAN is not available for wide release" (S3). Home Assistant and Music Assistant use it anyway (S9, S10). | Groups, playback, volume, audioClip (announcements) and home theater. No queue, browse, alarms or EQ (S10). | Supplement only, for announcements. |
| **Cloud Control API** | Official. OAuth2 with a public HTTPS redirect, and events delivered by HTTPS webhook (S1, S2). | No queue view or edit, no browse or search, no EQ, no alarms, no sleep timer (S1). | **Not used.** It needs a server and covers less than the local interfaces. |
| **SMAPI (music services)** | Built for Sonos players and apps; there is no sanctioned third-party browse or search (S4). | The community route depends on decrypting tokens stored on the players. SoCo PR #1010 does this, and the maintainer blocked it on 2026-10-13 over legal and security risk (S11, S12). | **Not used.** See §2.3. |

### 2.2 Official app inventory, 2024–2026

The 2024 redesign removed many features. Most came back during 2024–2026, including queue editing, playlist editing, alarms with snooze, the sleep timer and the music library, and save-queue-as-playlist arrived 2026-01-27 (S13, S14). The full inventory is in the matrix in §5.

### 2.3 Music services: a hard limit for any third-party controller

Native browsing and search of the services linked in your Sonos account is not reliably available to third-party apps (S11, S12, S15). These routes are available:

1. **Sonos Favorites and Sonos Playlists.** Anything you favorite in the official app becomes playable here. Fully reliable.
2. **Share links.** Paste a Spotify, Apple Music, TIDAL or Deezer link. SoCo's ShareLink plugin queues it through the account already linked on the speaker (S16).
3. **Music Assistant (Path A only).** Search and stream through Music Assistant's own provider accounts. These are separate from the Sonos-linked accounts: "Sonos is not a music provider" (S17).
4. **Spotify Web API search (optional, either path).** Uses your own Spotify client ID, and plays the results through route 2.

### 2.4 Prior art

| Project | State | Takeaway |
|---|---|---|
| noson (Qt, Linux) | Flathub: "This application is no longer available on Flathub… does no longer work as flatpak package" (S18) | The best Linux controller is effectively gone from SteamOS. |
| Sonos web app (play.sonos.com) | Basic: grouping, playback, queue view, no settings (S19) | Usable today as a stopgap in a Deck browser. |
| Decky plugin store | 116 plugins, none for Sonos. "Music Control" handles local MPRIS players only (S20) | The gap is real. |
| HA Deck (Decky) | 2026-03; lights, switches and sensors through Home Assistant; manual install (S21) | Shows that a Home Assistant client in the Quick Access Menu works. No media player support. |
| Home Assistant Sonos integration | Core integration built on SoCo 0.31.5 and sonos-websocket. Handles event fallback, resubscription and favorites playback (S9, S22) | Already solves most of the hard engineering. |
| Sonos Card (HACS) | Player, groups, grouping, per-room volume, favorites, queue (show, play, rearrange), search (through Music Assistant), sleep timer (S23) | Covers most of the official app's main screens. |

### 2.5 Distribution policy constraints (verified)

- **Decky store:** the submission template requires the checkbox "Generative AI was NOT used to write a majority of the code I am submitting" (S24). Any Decky plugin built in this project is **self-distributed**, installed from a zip or URL with Decky's developer mode.
- **Flathub:**
  - "Flathub manifests must not contain AI-generated or AI-assisted content."
  - "AI tools or agents must not open or automate Flathub submission pull requests."
  - "Official affiliation must not be implied by using a vendor's name in the application name or icon." (S25)
  - Consequence: any Flatpak is **self-hosted**, as a `.flatpak` bundle on GitHub Releases.

---

## 3. Architecture decision

### Path A — Home Assistant first (**recommended**)

```
 Steam Deck (Game/Desktop)        Windows PC           Phone
 ┌──────────────────────┐   ┌─────────────────┐   ┌──────────┐
 │ Browser app-window   │   │ Edge --app=URL  │   │ HA app / │
 │ (kiosk dashboard)    │   └────────┬────────┘   │ browser  │
 │ + Decky QAM plugin   │            │            └────┬─────┘
 └─────────┬────────────┘            │                 │
           └──────────── HTTP/WebSocket ───────────────┘
                              │
                  ┌───────────▼─────────────┐
                  │ Home Assistant (NAS)    │
                  │  • Sonos integration    │──UPnP 1400 / WS 1443──► Sonos
                  │  • Music Assistant      │
                  │  • HACS: Sonos Card,    │
                  │    kiosk-mode           │
                  │  • sonos_extras (ours)  │
                  └─────────────────────────┘
```

**Why it is recommended**
- **The protocol work is already done and maintained upstream.** That includes event fallback to polling, resubscription, and the alarm-write spacing (S22).
- **One server serves every client.** "Windows later" becomes a browser shortcut instead of a port.
- **Music Assistant is the cleanest available music-service search** (§2.3).
- **Moving off the NAS later is cheap.** Since HA 2025.1, restoring a backup works on every install type (S26).
- **It gains features the official app also has.** Remote control away from home and automations come with HA.

**Costs**
- **NAS dependency.** If HA is down, so is this controller. The official app remains the fallback.
- **HACS cards break on HA updates.** It has happened in 2026 to the Sonos Card, browser_mod and kiosk-mode (S23, S27).
  - Mitigation: pin versions, keep the dashboard YAML in this repo, and update deliberately.
- **Weaker gamepad navigation in a browser.** Touch and the trackpads compensate in Game Mode.
- **Gaps in HA itself** (§5) need a small custom integration, `sonos_extras`. It reuses the SoCo library HA already ships.

### Path B — Standalone app (fallback)

```
 ┌──────────────── SonosDeck (Python 3.12, Flatpak) ───────────────┐
 │ ui/      pygame-ce (SDL2): focus-grid widgets, gamepad, OSK     │
 │ core/    SoCo 0.32 wrapped in a worker pool; state store        │
 │          discovery chain • topology • event mgr + watchdog      │
 │          resume handler • UPnP-off (403) detector               │
 │ extras/  sonos-websocket (audioClip announcements, optional)    │
 └──────────────────────────────────────────────────────────────────┘
 Optional: Decky QAM plugin reusing core/ (self-distributed)
```

**Stack rationale**
- **SoCo 0.32.0** (2026-10-15) has the broadest feature coverage, is actively maintained, and is what HA uses (S16).
  - New in 0.32: favorites writes and queue reordering.
  - Its API is synchronous, so the app wraps it in a worker pool.
- **pygame-ce** for the UI:
  - A wheel of about 12 MB.
  - SDL2 game-controller support.
  - SDL2 opens Steam's on-screen keyboard automatically when it sees `SteamDeck=1` (S28).
  - Ports cleanly to Windows.
  - Runner-up: PySide6/QML, which costs about 0.3–0.8 GB of extra Flatpak runtime and still needs SDL for gamepad input (S28).
- **Packaging:**
  - Linux: a self-hosted Flatpak bundle on the freedesktop runtime, with `--share=network`, `--device=input` (plus a fallback for older Flatpak), and `--socket=x11`.
  - Windows (later): PyInstaller in onedir mode, plus a firewall allow-rule set at install time (S28).

**Engineering items Path B must build that HA already has**
- Subscription watchdog and resubscribe on Deck resume.
- A discovery fallback chain: SSDP, then mDNS, then cached IPs, then a subnet scan, then manual IP.
- Detection of UPnP being off.
- Favorites playback logic.
- Polling when the firewall blocks inbound events.
- Paging of Browse results, which are capped at 1000 items per call.

---

## 4. UX design (both paths)

- **Screen:** target 1280×800 at 16:10. Large touch targets of at least 48 px. Body text 16 px or larger. Dark theme. Flat shapes plus album art; no animation beyond simple transitions.
- **Screens:**
  - **Now Playing:** album art, transport, group volume and per-room volume.
  - **Rooms:** group and ungroup, per-room volume and mute, preset groups.
  - **Queue:** play, remove, reorder, clear, save.
  - **Browse:** Favorites, Sonos Playlists, Library, Search and Share-link.
  - **Settings per room:** EQ, home theater, alarms, sleep timer, status light, touch lock, battery.
- **Gamepad map (Path B native; Path A through a Steam Input layout):**

  | Input | Action |
  |---|---|
  | D-pad / left stick | Move focus |
  | A | Select |
  | B | Back |
  | X | Play/pause |
  | Y | Context menu |
  | L1 / R1 | Previous / next screen |
  | L2 / R2 | Volume down / up |
  | View | Rooms |
  | Menu | Settings |

- **Decky Quick Access Menu mini-player (phase 4, optional):**
  - Now-playing line, play/pause/skip, group volume and per-room sliders, room picker, favorites list.
  - It works over any game without switching windows.

---

## 5. Feature coverage matrix

Key: Y = yes · P = partial · N = no · ? = verify during build · OOS = out of scope.

| Feature | Official app | Path A (HA + Sonos Card + MA + sonos_extras) | Path B (standalone) |
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
| Music-service search and browse | Y | P (Music Assistant's own accounts; share links) | P (share links; optional Spotify Web API) |
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
| Battery level, power state (Roam/Move) | Y | Y | Y (S2) |
| Rename room | Y | sonos_extras | Y |
| Volume limit | Y | ? | ? |
| Software update: check | Y | sonos_extras (check only) | Y (check only) |
| Announcements / TTS | (Voice only) | Y (port 1443) | P (optional) |
| Remote control away from home | Y | Y (HA remote access) | N (LAN only) |
| Automations | Partial (alarms) | Y | N |
| Stereo pair, surround, sub bonding | Y | OOS | OOS (Sonos restricts this to user-initiated setup) |
| Trueplay tuning | Y (iOS mic / Quick Tuning) | OOS (on/off only) | OOS (on/off only) |
| Setup, Wi-Fi, SonosNet, voice assistants, AirPlay, account | Y | OOS | OOS |

**Bottom line:** both paths reach roughly the same parity ceiling. Everything marked OOS stays in the official app regardless of path. Path A reaches that ceiling with far less custom code.

---

## 6. Phased delivery

Each phase ends with an acceptance check you run on the Deck.

### Path A (recommended)

| Phase | Deliverable | Acceptance |
|---|---|---|
| **A0 Prereqs** | Install-type decision (HA OS VM preferred; Container acceptable); DHCP reservations for the speakers and the Deck; check UPnP in Connection Security | Speakers reachable from the NAS on 1400 and 1443 |
| **A1 Core** | HA on the NAS (host networking if Container); Sonos integration; Music Assistant; HACS; encrypted backups with the key stored offline | Every room appears; entities from §5 are present; a backup restore is tested |
| **A2 Dashboard** | `SonosDeck/ha/dashboard.yaml` (versioned) with views for Now Playing (panel), Rooms, Queue, Browse and Settings; kiosk-mode; tuned for 1280×800 | Every screen in §4 is usable by touch on the Deck |
| **A3 Deck and Windows launchers** | Launcher script for a browser app window, added to Steam; recommended Steam Input layout; Windows Edge `--app` shortcut | Launches from Game Mode in under 5 s with no browser chrome |
| **A4 sonos_extras** | Small HA custom integration (Python, uses HA's SoCo) adding the actions HA lacks (§5); dashboard buttons wired to it | Every "sonos_extras" row in §5 works |
| **A5 Decky mini-player (optional)** | QAM plugin talking to the HA WebSocket API with a long-lived token; self-distributed zip | Play/pause, volume and room switch work in-game |

### Path B (if Path A is rejected)

| Phase | Deliverable | Acceptance |
|---|---|---|
| **B0 Risk spikes** | Flatpak bundle skeleton; SDL controller in Game Mode; Steam on-screen keyboard through `steam://open/keyboard` from inside Flatpak (unverified, S28); SSDP and event callbacks inside the Flatpak sandbox; SteamOS firewall state | All four spikes pass on the device, or a documented workaround exists |
| **B1 Core** | Discovery chain, topology/state store, event manager with watchdog, resume handler, 403 detection, tests against recorded SOAP fixtures | Unit tests pass; live state stays accurate across a sleep/resume |
| **B2 Play** | Now Playing, Rooms/grouping, volume | §5 rows: rooms/grouping → shuffle/repeat/crossfade |
| **B3 Content** | Queue, Favorites, Playlists, Library, share links, optional Spotify search | §5 rows: queue → line-in/TV |
| **B4 Settings** | EQ, home theater, alarms, sleep timer, light, lock, battery, rename, update check | §5 rows: alarms → software update check |
| **B5 Decky (optional)** | QAM plugin reusing core/; self-distributed. `lxml` must match Decky's frozen Python ABI (S28) | Works in-game |
| **B6 Windows** | PyInstaller onedir build and installer firewall rule | Discovery and events work on Windows |

---

## 7. Risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Sonos turns off or removes UPnP on port 1400 | Both paths lose most features | Detect 403 and show the fix; HA tracks upstream changes; the port-1443 WebSocket covers basics |
| No sanctioned music-service browsing | Search is weaker than the official app | Favorites/playlists, share links, Music Assistant, Spotify Web API (§2.3) |
| HACS card breakage (A) | Dashboard regressions | Pin versions; YAML in git; update deliberately |
| NAS downtime (A) | No control from the Deck | Official app or play.sonos.com as fallback |
| Store AI policies (Decky, Flathub) | No store listing | Self-distribute zip and `.flatpak` bundle (§2.5) |
| Steam on-screen keyboard from Flatpak (B) | Search typing in Game Mode | B0 spike; in-app keyboard fallback |
| Firewall blocks events (SteamOS state unverified; Windows prompts) | Stale UI | Polling fallback; Windows installer rule |
| Sleep/resume and IP change | Lost subscriptions | Resume detection, then rediscover and resubscribe |
| Sonos trademark in the name | Takedown or rejection | Distinct public name (§8) |

---

## 8. Naming

"SonosDeck" is a working name for this private repo only. A public build must not imply affiliation with Sonos in its name or icon (S25). Pick the final name before any release.

---

## 9. Draft project setup file (requires approval)

No project setup file exists in this repo. Proposed `SonosDeck/PROJECT.md`:

```markdown
# SonosDeck — Project Setup

## Purpose
Unofficial Sonos controller for Steam Deck (Desktop + Game Mode); Windows later.

## Architecture (per accepted PLAN.md path)
- Path A: Home Assistant on NAS + Sonos integration + Music Assistant + HACS
  (Sonos Card, kiosk-mode) + `sonos_extras` custom integration + Deck launcher.
- Path B: Python 3.12 + SoCo 0.32 core + pygame-ce UI, Flatpak bundle.

## Environment
- Sonos system: <S1|S2>, rooms/models: <list>
- Network: <subnet/VLAN>, speaker IPs reserved: <yes/no>
- NAS: <model/OS>, HA install type: <HAOS VM|Container>, HA URL: <url>
- Deck: SteamOS <version>, LCD/OLED

## Conventions
- All config (dashboard YAML, integration code) lives in `SonosDeck/`.
- Pin versions of HA custom cards/integrations; record in `SonosDeck/VERSIONS.md`.
- No secrets in git (HA tokens, Spotify client secrets go in local files listed in .gitignore).
- Distribution: self-hosted only (Decky/Flathub AI policies). No "Sonos" in public name/icon.

## Testing
- Acceptance checks per phase run on the physical Deck in Game Mode and Desktop Mode.
- Path B: unit tests against recorded SOAP fixtures; no live-speaker tests in CI.

## References
- PLAN.md §11 (sources)
```

---

## 10. Open questions (answers determine the final path)

1. **NAS make, model and OS** (Synology, Unraid, TrueNAS, QNAP), and can it run VMs? This decides HA OS in a VM versus Container.
2. **Is HA already running anywhere,** or is this a fresh install?
3. **Game Mode input:** is touch and trackpad acceptable, or is full gamepad-only navigation required?
4. **Sonos system:** S1 or S2? Which models: home theater, sub, portables? This affects the settings screens.
5. **Music services used:** Spotify, Apple Music, others? This decides between Music Assistant and Spotify Web API search.
6. **Network:** one subnet, or VLANs, mesh, UniFi? This affects discovery.
7. **Approve** creating `SonosDeck/PROJECT.md` from §9?
8. **Approve Path A, Path B, or a hybrid?**

---

## 11. Sources

**Sonos official**
- S1. Control API reference index — https://docs.sonos.com/llms.txt ; https://docs.sonos.com/docs/control
- S2. Authorization and subscriptions — https://docs.sonos.com/docs/authorize ; https://docs.sonos.com/docs/subscribe
- S3. Connected-home architecture ("not available for wide release") — https://docs.sonos.com/docs/connected-home-architecture
- S4. SMAPI overview — https://docs.sonos.com/docs/smapi
- S5. Connection Security settings — https://support.sonos.com/en-us/article/adjust-connection-security-settings
- S6. Sonos community, player update thread (UPnP "no longer actively maintained") — https://en.community.sonos.com/product-updates/a-new-player-update-is-live-6930092
- S13. App release notes — https://support.sonos.com/en-us/article/release-notes-sonos-app-updates
- S14. App roadmap update (2024) — https://www.sonos.com/en/blog/update-on-the-sonos-app
- S15. Security advisory SSA-2025-0002 — https://www.sonos.com/security-advisory-2025-0002
- S19. Web app — https://support.sonos.com/en-us/article/using-the-queue-in-the-sonos-app ; https://support.sonos.com/en/article/sonos-app-requirements

**Community and GitHub**
- S7. Home Assistant 403 reports — https://github.com/home-assistant/core/issues/154877
- S8. svrooij Sonos UPnP docs — https://sonos.svrooij.io/services/
- S9. Home Assistant Sonos integration — https://www.home-assistant.io/integrations/sonos/ ; https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/manifest.json
- S10. aiosonos and sonos-websocket — https://pypi.org/project/aiosonos/ ; https://github.com/jjlawren/sonos-websocket
- S11. SoCo music-services issue — https://github.com/SoCo/SoCo/issues/557
- S12. SoCo PR #1010 (blocked) — https://github.com/SoCo/SoCo/pull/1010
- S16. SoCo — https://pypi.org/project/soco/ ; https://github.com/SoCo/SoCo/releases/tag/v0.32.0 ; https://soco.readthedocs.io/en/latest/api/soco.plugins.html
- S17. Music Assistant Sonos support — https://www.music-assistant.io/player-support/sonos/ ; https://community.home-assistant.io/t/music-assistant-2-0-your-music-your-players/727626?page=66
- S18. noson on Flathub — https://flathub.org/apps/io.github.janbar.noson
- S20. Decky plugin store — https://plugins.deckbrew.xyz/plugins ; https://github.com/martinpl/MusicControl
- S21. HA Deck — https://community.home-assistant.io/t/ha-deck-control-home-assistant-from-steam-deck-quick-access-menu/999857
- S22. Home Assistant Sonos internals — https://github.com/home-assistant/core/blob/dev/homeassistant/components/sonos/speaker.py
- S23. Sonos Card — https://github.com/punxaphil/custom-sonos-card ; https://community.home-assistant.io/t/dashboard-sonos-card/393620
- S27. kiosk-mode — https://github.com/NemesisRE/kiosk-mode ; browser_mod thread — https://community.home-assistant.io/t/browser-mod-turn-your-browser-into-a-controllable-device-and-a-media-player/123806?page=131

**Platform**
- S24. Decky plugin submission template — https://github.com/SteamDeckHomebrew/decky-plugin-database (.github/PULL_REQUEST_TEMPLATE/plugin_addition.md)
- S25. Flathub requirements (AI and trademark rules) — https://docs.flathub.org/docs/for-app-authors/requirements
- S26. HA 2025.1 backup restore on all install types — https://home-assistant.io/blog/2025/01/03/release-20251/
- S28. Steam Deck and toolkit references:
  - SDL Steam on-screen keyboard — https://github.com/libsdl-org/SDL
  - Flatpak permissions — https://docs.flatpak.org/en/latest/sandbox-permissions.html
  - Steam Deck recommendations — https://partner.steamgames.com/doc/steamdeck/recommendations
  - Decky template — https://github.com/SteamDeckHomebrew/decky-plugin-template
  - Decky loader — https://github.com/SteamDeckHomebrew/decky-loader
  - pygame-ce controller — https://pyga.me/docs/ref/sdl2_controller.html
  - Flathub runtime sizes — https://flathub.org/api/v2/summary/org.freedesktop.Platform
  - Windows Firewall rules — https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/rules
