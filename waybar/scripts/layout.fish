#!/usr/bin/env fish

mmsg get all-monitors | jq -r '.monitors[] | select(.active == true) | .layout_symbol'

mmsg watch all-monitors | while read -l line
    echo $line | jq -r '.monitors[] | select(.active == true) | .layout_symbol'
end
