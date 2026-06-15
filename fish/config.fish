function fish_greeting
    set_color yellow
    printf "  %s " (date +%H:%M)

    set_color brblack
    printf "│ "
    set_color cyan
    printf "󰍛 %s " (free -h | awk '/^Mem:/ {print $3 "/" $2}')

    set_color brblack
    printf "│ "
    set_color green
    printf "󰘚 %s%% " (top -bn1 | awk '/Cpu\(s\)/ {print int($2+$4)}')

    set_color brblack
    printf "│ "
    set_color blue
    printf "󰋊 %s " (df -h / | awk 'NR==2 {print $5}')

    set_color brblack
    printf "│ "
    set_color magenta
    printf "Pacman: 󰚰 %s " (pacman_cached_upgrades_count)

    printf "\n"

    set_color normal
end

function cp
    /usr/local/bin/advcp -g $argv
end

function mv
    /usr/local/bin/advmv -g $argv
end

function pacman_cached_upgrades_count
    set count 0
    set arch (uname -m)
    for line in (pacman -Qu)
        # Parse package name and new version (handles epoch)
        set pkg (string split ' ' $line | head -n1)
        set newver (string split ' ' $line | string split ' -> ' | tail -n1)
        # Build the glob pattern for the cache file
        set pattern /var/cache/pacman/pkg/$pkg-$newver-$arch.pkg.tar.zst
        set matches $pattern
        if set -q matches[1]
            set count (math $count + 1)
        end
    end
    echo $count
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# This prevents me from installing packages with pip without being in a virtualenv first.
set -g -x PIP_REQUIRE_VIRTUALENV true

# Created by `pipx` on 2026-06-12 08:47:33
set PATH $PATH /home/emmdie/.local/bin
