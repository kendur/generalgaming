@echo off
rem Opens the SonosDeck mini view as a Microsoft Edge app window. Set HA_URL to your Home Assistant address.
set "HA_URL=http://homeassistant.local:8123"
start "" msedge --app="%HA_URL%/sonos-deck/mini?kiosk"
