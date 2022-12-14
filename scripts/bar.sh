#!/usr/bin/zsh

# ^c$var^ = fg color
# ^b$var^ = bg color

#interval=0

# load colors
. /opt/meta-wm/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
  # updates=$(doas xbps-install -un | wc -l) # void
  updates=$(checkupdates | wc -l &)   # arch
  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

  if [ -z "$updates" ]; then
    printf "  ^c$green^    Fully Updated"
  else
    printf "  ^c$green^    $updates"" updates"
  fi
}

battery() {
	FILE=/sys/class/power_supply/BAT1/capacity
	if test -f "$FILE"; then
		get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
		printf "^c$blue^   $get_capacity"
	fi
}

brightness() {
	FILE=/sys/class/backlight/*/brightness
	if test -f "$FILE"; then
		printf "^c$red^   "
		printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
	fi
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%Y-%m-%d %H:%M')  "
}

while true; do

  #[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  #interval=$((interval + 1))

  #sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
  sleep 1 && xsetroot -name "$(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
