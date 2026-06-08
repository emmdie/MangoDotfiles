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
    printf "Pacman: 󰚰 %s " (checkupdates 2>/dev/null | count)

    printf "\n"

    set_color normal
end

function cp
    /usr/local/bin/advcp -g $argv
end

function mv
    /usr/local/bin/advmv -g $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# This prevents me from installing packages with pip without being in a virtualenv first.
set -g -x PIP_REQUIRE_VIRTUALENV true

# ABBREVIATIONS
abbr --add hx helix
