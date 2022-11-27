#!/bin/sh

xrdb -merge /opt/meta-wm/.Xresources
xbacklight -set 10 &
feh --bg-fill /opt/meta-wm/scripts/wallpaper.png &
xset r rate 200 50 &
picom &

/opt/meta-wm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
