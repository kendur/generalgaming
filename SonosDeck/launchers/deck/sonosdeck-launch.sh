#!/usr/bin/env bash
# Opens a SonosDeck dashboard view as a standalone app window, with no browser chrome.
# Usage: sonosdeck-launch [main|mini|settings]
set -euo pipefail

view="${1:-main}"
conf="${XDG_CONFIG_HOME:-$HOME/.config}/sonosdeck/launcher.conf"
# shellcheck source=/dev/null
[ -f "$conf" ] && . "$conf"
: "${HA_URL:?Set HA_URL in $conf, e.g. HA_URL=http://homeassistant.local:8123}"
url="${HA_URL%/}/${DASHBOARD:-sonos-deck}/${view}?kiosk"

# The --app flag needs a Chromium-based browser. Try Flatpaks first (the usual install on SteamOS).
for app in com.google.Chrome org.chromium.Chromium com.microsoft.Edge com.brave.Browser; do
  if flatpak info "$app" >/dev/null 2>&1; then
    exec flatpak run "$app" --app="$url"
  fi
done
for bin in chromium google-chrome-stable microsoft-edge brave; do
  if command -v "$bin" >/dev/null 2>&1; then
    exec "$bin" --app="$url"
  fi
done

echo "sonosdeck-launch: no Chromium-based browser found; opening in the default browser" >&2
exec xdg-open "$url"
