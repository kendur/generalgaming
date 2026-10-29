# SonosDeck launchers

These open the Home Assistant dashboard views (`main`, `mini`, `settings`) as standalone app windows with no browser chrome. The `?kiosk` flag also hides HA's header and sidebar.

## Steam Deck (Desktop Mode)

**Needs a Chromium-based browser.** Install one from Discover if none is present: Chrome, Chromium, Edge or Brave. Firefox has no `--app` mode.

```bash
bash SonosDeck/launchers/deck/install.sh
```

**What it does**
- Installs `~/.local/bin/sonosdeck-launch`.
- Adds three menu entries: **SonosDeck**, **SonosDeck Mini** and **SonosDeck Settings**.
- Creates `~/.config/sonosdeck/launcher.conf`. Set `HA_URL` there.
- Nothing outside your home directory changes, so it survives SteamOS updates.
- On the first launch, log in to HA and tick "Keep me logged in".

### Window placement and the pop-out mini-player

Use KDE window rules (System Settings > Window Management > Window Rules):
1. Open the window you want to place, such as SonosDeck Mini.
2. Click **Add New…**, then **Detect Window Properties**, and click the window. KDE fills in the window class and title, so you don't have to guess them.
3. Add properties:
   - **Mini:** Keep above = Force; Position and Size = Remember; Screen = your choice.
   - **Main:** Screen = your second monitor; Size = Remember (or Maximized).
4. Apply.

## Windows (later)

Edit `HA_URL` in the `.cmd` files, then double-click one, or pin a shortcut to it:
- `windows/SonosDeck-Main.cmd`
- `windows/SonosDeck-Mini.cmd`

They open Microsoft Edge in `--app` mode.
