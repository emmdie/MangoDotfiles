function boom
    set -l mac C0:28:8D:FA:BF:6F
    set -l sink bluez_output.C0_28_8D_FA_BF_6F.1
    
    if not bluetoothctl info $mac | grep -q "Connected: yes"
        bluetoothctl connect $mac
        sleep 2
    end
    
    pactl set-default-sink $sink
end
