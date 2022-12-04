#!/bin/sh

xrdb -merge /opt/meta-wm/.Xresources
xbacklight -set 10 &
feh --bg-fill /opt/meta-wm/scripts/wallpaper.png &
xset r rate 200 50 &
picom &

# Trigger screensaver after 10 minutes of inactivity
xset s on
xset s 300 5
#xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

/opt/meta-wm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
