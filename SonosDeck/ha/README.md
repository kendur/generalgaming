# Home Assistant on the QNAP: runbook (Path A)

Covers phases A0–A3 in [../PLAN.md](../PLAN.md) §6.

**Before you start**
- **Run every command from a session on the LAN.** That means a local Claude Code session, or this repo attached through Remote Control from the Deck or another Linux or Mac machine.
- **Read the QNAP access docs first:** `CLAUDE.md`, `.claude/QNAP_ACCESS.md` and `.claude/QNAP_CLAUDE.md`. They override anything here about how the NAS may be changed.
- **Record results** in the "Result" columns and in [../PROJECT.md](../PROJECT.md).

---

## A0: Access and inventory (read-only)

### NAS facts

These are QTS-specific paths and tools. Verify them on your QTS version.

```bash
ssh claude-admin@<qnap-host> '
  uname -m
  grep -m1 "model name" /proc/cpuinfo
  free -m
  df -h /share
  grep -iE "^(Model|Version|Build Number)" /etc/config/uLinux.conf
  echo "Container Station: $(getcfg container-station Enable -f /etc/config/qpkg.conf)"
  echo "Virtualization Station: $(getcfg QKVM Enable -f /etc/config/qpkg.conf)"
'
```

| Fact | Result |
|---|---|
| Model / QTS version | |
| CPU architecture (`uname -m`) | |
| RAM total / free | |
| Free space on the data volume | |
| Container Station installed | |
| Virtualization Station installed | |

### Speakers

Run this from the Deck or any Linux machine on the LAN.
- **If `python3 -m venv` isn't available on SteamOS:** run the probe inside the HA container after A1 instead, where SoCo is already installed.

```bash
python3 -m venv ~/.venvs/sonos-probe && ~/.venvs/sonos-probe/bin/pip install soco
~/.venvs/sonos-probe/bin/python - <<'EOF'
import soco
zones = soco.discover(timeout=5) or set()
for z in sorted(zones, key=lambda z: z.player_name):
    info = z.get_speaker_info()
    try:
        z.volume  # SOAP call: HTTP 403 here means UPnP is off (Sonos app > Account > Privacy & Security > Connection Security)
        upnp = "ok"
    except Exception as exc:
        upnp = f"FAIL ({type(exc).__name__}: {exc})"
    print(f"{z.player_name:20} {z.ip_address:15} {info['model_name']:22} {info['software_version']:14} UPnP:{upnp}")
EOF
```

- **S1 or S2:** software version 11.x means S1. Anything newer means S2.
- **DHCP reservations:** add one for every speaker and for the NAS or HA VM.

### Install-type decision

PLAN §3:
- **x86-64, Virtualization Station available, and 8 GB or more RAM:** Option 1.
- **Otherwise:** Option 2.

---

## A1, Option 1: Home Assistant OS VM in Virtualization Station (recommended)

**Steps**
1. Download the KVM image (`haos_ova-<version>.qcow2.xz`) from https://www.home-assistant.io/installation/linux and decompress it.
2. In Virtualization Station, create a VM by importing the `.qcow2`, with these settings:
   - **CPU and memory:** 2 vCPU and 4096 MB RAM. That keeps expected load under 85%; HA's minimum is 2 GB and 2 vCPU.
   - **Firmware:** UEFI without Secure Boot. HA requires UEFI.
   - **Disk:** 32 GB, the image's default.
   - **Network:** a Virtual Switch in **bridge** mode on the LAN adapter, not NAT. SSDP multicast and inbound event callbacks need a bridged network.
3. Boot the VM. Add a DHCP reservation for its MAC address, then open `http://homeassistant.local:8123` (or the VM's IP).
4. Complete onboarding. HA discovers the Sonos speakers automatically, so add the integration when prompted.
5. Install HACS by following https://hacs.xyz (Home Assistant OS method).

**Rollback:** shut down and delete the VM. Nothing else on the NAS changes.

## A1, Option 2: Container Station

**Steps**
1. Create `${STACK_ROOT}/homeassistant` on the QNAP. Default `STACK_ROOT` is `/share/Container/sonosdeck`.
2. Copy `compose.yaml` and `.env.example` there. Rename `.env.example` to `.env` and set `TZ`.
3. Start the stack: in Container Station choose Applications > Create, or run `docker compose up -d` in `${STACK_ROOT}` (only if the QNAP docs allow it).
4. **If QuFirewall is enabled,** allow inbound traffic from the LAN subnet on:
   - TCP 8123 (HA web UI)
   - TCP 1400–1499 (Sonos event callbacks)
   - TCP 8095 and 8097, only if Music Assistant runs
5. Install HACS by following https://hacs.xyz (container method).

**Rollback:** run `docker compose down`, then delete `${STACK_ROOT}`.

## A1: post-install checks (both options)

| Check | Result |
|---|---|
| Settings > Devices & services > Sonos lists every room | |
| No "subscription failed" or polling-fallback warnings in the logs (these mean inbound TCP 1400 is blocked) | |
| Entities from PLAN §5 are present (EQ, home theater, alarms, battery) | |
| Automatic encrypted backups are on, with the key stored offline | |
| A test restore works | |
| Versions recorded in [VERSIONS.md](VERSIONS.md) | |

---

## A2: Spotify routes (PLAN §2.3)

Test the routes in order and keep what works.

| # | Test | Result |
|---|---|---|
| 1 | Play a Sonos Favorite and a Sonos Playlist from HA | |
| 2 | Call `media_player.play_media` on a Sonos entity with a Spotify share link (track, album, playlist) | |
| 3 | Spotify desktop app (Flatpak) on the Deck: Connect to a Sonos room; HA shows now playing | |
| 4 | HA Spotify integration (your own developer app, Premium): browse your library under a Sonos player; playback starts natively | |
| 5 | Only if 4 falls short: SpotifyPlus (HACS) | |
| 6 | Optional: Music Assistant with the Spotify provider. Use librespot, or Soloist if librespot shows `Key Error`; Soloist is at your own risk | |
| — | YouTube Music: play a YouTube Music item that is saved as a Sonos Favorite | |

---

## A3: Dashboard

1. From HACS, install the Sonos Card, kiosk-mode and auto-entities. Record their versions.
2. Settings > Dashboards > Add dashboard > New dashboard from scratch. Use the title **SonosDeck** and the URL **`sonos-deck`**.
3. Open the new dashboard > Edit > ⋮ > Raw configuration editor, and paste [dashboards/sonosdeck.yaml](dashboards/sonosdeck.yaml).
4. Install the launchers from [../launchers/](../launchers/). Check `main`, `mini` and `settings` on both monitors.
