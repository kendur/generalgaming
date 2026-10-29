#!/usr/bin/env bash
# Installs the SonosDeck dashboard launchers for the current user (no root, survives SteamOS updates).
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
bin_dir="$HOME/.local/bin"
app_dir="${XDG_DATA_HOME:-$HOME/.local/share}/applications"
conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}/sonosdeck"

mkdir -p "$bin_dir" "$app_dir" "$conf_dir"
install -m 0755 "$here/sonosdeck-launch.sh" "$bin_dir/sonosdeck-launch"

if [ ! -f "$conf_dir/launcher.conf" ]; then
  cat > "$conf_dir/launcher.conf" <<'EOF'
# SonosDeck launcher settings
HA_URL=http://homeassistant.local:8123
DASHBOARD=sonos-deck
EOF
  echo "Created $conf_dir/launcher.conf (edit HA_URL if needed)"
fi

write_desktop() {  # $1 = view, $2 = display name, $3 = comment
  cat > "$app_dir/sonosdeck-$1.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=$2
Comment=$3
Exec=$bin_dir/sonosdeck-launch $1
Icon=audio-speakers
Categories=AudioVideo;Audio;Player;
Terminal=false
EOF
}
write_desktop main "SonosDeck" "Sonos controller (Home Assistant dashboard)"
write_desktop mini "SonosDeck Mini" "Sonos mini-player"
write_desktop settings "SonosDeck Settings" "Sonos speaker settings"

command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$app_dir" || true
echo "Installed. Find 'SonosDeck' in the application launcher."
