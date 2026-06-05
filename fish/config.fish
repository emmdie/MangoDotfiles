if status is-interactive
    # Commands to run in interactive sessions can go here
end
# This prevents me from installing packages with pip without being in a virtualenv first.
set -g -x PIP_REQUIRE_VIRTUALENV true

# ABBREVIATIONS
abbr --add hx helix
