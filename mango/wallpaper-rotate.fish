#!/usr/bin/env fish

set wallpaper_dir $HOME/.config/Wallpapers
set wallpaper (find $wallpaper_dir -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

# stop any previous swaybg (managed or stray)
systemctl --user stop swaybg.service 2>/dev/null
pkill -x swaybg
systemctl --user reset-failed swaybg.service 2>/dev/null

# launch swaybg as its own transient unit so it outlives this oneshot service
systemd-run --user --unit=swaybg --collect swaybg -o '*' -i "$wallpaper" -m fill
