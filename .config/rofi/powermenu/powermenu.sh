#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Powermenu

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style'

# CMDs
user="$(whoami)"
host=`hostname`
uptime="`uptime -p | sed -e 's/up //g'`"
distro="$(. /etc/os-release && echo "$NAME")"
today="$(date +"%B %d, %Y")"
time="$(date +"%I:%M %p")"

# Options
shutdown='Poweroff'
reboot='Reboot'
lock='Lock'
suspend='Sleep'
# logout='Logout'
yes='Y'
no='N'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$user" \
		-mesg "$time  ─  $today" \
		-theme ${dir}/${theme}.rasi
}

Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 200px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Confirm?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			systemctl suspend
		# elif [[ $1 == '--logout' ]]; then
		# 	if [[ "$XDG_CURRENT_DESKTOP" == 'niri' ]]; then
		# 		niri msg action quit
		# 	fi
    fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/gtklock' ]]; then
			gtklock
		fi
        ;;
    $suspend)
		run_cmd --suspend
        ;;
  #   $logout)
		# run_cmd --logout
  #       ;;
esac
