# SonosDeck — Project Setup

Read this before any SonosDeck work. The plan of record is [PLAN.md](PLAN.md).

## Purpose

An unofficial Sonos controller for the Steam Deck.
- It runs in **Desktop Mode**, with the Deck docked to two large monitors. Game Mode is out of scope.
- A Windows build comes later.

## Delivery order (accepted 2026-10-29)

1. **Path A.** Home Assistant on the QNAP NAS, plus:
   - the Sonos integration
   - the SonosDeck dashboard
   - launchers for the Deck and Windows
   - a `sonos_extras` integration, built only if HA turns out to lack features
2. **Path B.** A standalone desktop app, started once Path A is in daily use.

## Environment

| Item | Value |
|---|---|
| NAS | QNAP. Model, CPU architecture and RAM: **TBD** (PLAN §6, A0) |
| HA install type | **TBD.** A Home Assistant OS VM in Virtualization Station if the NAS is x86-64 with enough RAM; otherwise Container Station |
| HA URL | TBD |
| Sonos system | S1/S2, rooms and models: **TBD**, to be discovered from the LAN (A0) |
| Network | One LAN/subnet. It may be segmented later (PLAN §7) |
| Deck | SteamOS, Desktop Mode, KDE Plasma, two external monitors, keyboard and mouse |
| Music | Spotify about 99%, YouTube Music about 1% |
| NAS access for local agents | SSH as `claude-admin` with a dedicated key. The access rules are in `CLAUDE.md`, `.claude/QNAP_ACCESS.md` and `.claude/QNAP_CLAUDE.md`, maintained outside this repo; their location is **TBD**. Read them before touching the NAS. |

## Layout

```
SonosDeck/
  PLAN.md            plan of record
  PROJECT.md         this file
  ha/                Home Assistant: install runbook, compose file, dashboards, pinned versions
  launchers/         Steam Deck (KDE) and Windows dashboard launchers
  app/               (Path B, later) standalone desktop app
```

## Conventions

- **Config lives in the repo.** Dashboard YAML and compose files are kept here. Changes made in HA's UI are exported back into the repo.
- **Pin versions.** HACS components are pinned in `ha/VERSIONS.md` and updated on purpose, never automatically.
- **No secrets in git.** HA tokens, Spotify credentials, SSH keys and `.env` files stay local (see `.gitignore`).
- **NAS changes:** back up first, write the rollback steps into `ha/README.md` before making the change, and prefer reversible steps.
- **Distribution:** self-hosted only. Do not use "Sonos" in any public name or icon (PLAN §2.5, §8).

## Testing and acceptance

- Each phase's acceptance checks (PLAN §6) run on the Deck in Desktop Mode.
- Path B uses unit tests against recorded SOAP fixtures. CI never touches live speakers.
