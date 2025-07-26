##
# Ez-Connect
##

# Launch an Android emulator
# `avd <device>`
function avd --a device -d 'launch android emulator'
    if not set -q device
        set device 'Google Nexus 4'
    end

    echo "Launch Genymotion emulator: $device"
    /opt/genymotion/player -n "'$device'" -s
end

function ff -d 'fzf: find files'
    fzf \
        --preview \
        'bat --style=numbers --color=always --line-range :500 {}' \
        --height=60% \
        --preview-window=right:60% \
        --reverse \
        --multi \
        --bind "enter:become(nvim {+})"
    # --query $argv
end

function osx -d 'Launch OSX_KVM'
    if not set -q OSX_KVM
        set OSX_KVM "$HOME/OSX-KVM"
    end

    echo "Launch OSX-KVM in: $OSX_KVM"

    cd "$OSX_KVM" || exit 1

    # ./OpenCore-Boot.sh &
    ./boot-macOS-headless.sh &

    sleep 5
    vncviewer localhost:5901 &
end

function sk -d 'Spine2D: skeleton viewer'
    set path=$args[1]
    echo "skeletonViewer => all json file in: $path"
    fd -e json . "$path" | fzf --preview 'cat {} | jq --color-output .' | xargs -r java -jar ~/apps/skeletonViewer-4.2.40.jar
end
