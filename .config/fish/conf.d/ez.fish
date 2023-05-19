# Ez-Conne
# A simple plugin for fish shell

# Launch an Android emulator
# `avd <device>`
function avd --a device -d 'launch android emulator'
    if not set -q device
        set device 'Google Nexus 4'
    end

    echo "Launch Genymotion emulator: $device"
    /opt/genymotion/player -n "'$device'" -s
end

function b -d btop
    btop $argv
end

function c -d 'xclip to clipboard'
    xclip -selection clipboard $argv
end

function f -d 'fzf: find files'
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

function ffmpeg_mov_mp4 -a input -a output -d 'ffmpeg: mov -> mp4'
    echo "MOV -> MP4: '$input' -> '$output'"
    ffmpeg -i "$input" \
        -vf yadif \
        -codec:v libx264 \
        -crf 1 \
        -bf 2 \
        -flags +cgop \
        -pix_fmt yuv420p \
        -codec:a aac \
        -strict -2 \
        -b:a 384k \
        -r:a 48000 \
        -movflags faststart \
        "$output"
end

function ffmpeg_mp4_h264 -a input -d 'ffmpeg: mp4/h264'
    echo "Encode '$input' -> H264"
    ffmpeg -i "$1" \
        -vcodec libx265 \
        -crf 28 \
        "$input"
end

function ffmpeg_mp4_mov -a input -a output -d 'ffmpeg: mp4 -> mov'
    echo "MP4 -> MOV: '$input' -> '$output'"
    ffmpeg -i "$input" \
        -vcodec dnxhd \
        -acodec pcm_s16le \
        -s 1920x1080 \
        -r 30000/1001 \
        -b:v 36M \
        -pix_fmt \
        yuv422p \
        -f mov \
        "$output"
end

function g -d 'git status'
    git status $argv
end

function gc -d 'git checkout a branch'
    git branch $argv | fzf \
        --preview "git show --color=always {-1}" \
        --bind "enter:become(git checkout {-1})"
end

function gf -d 'git fetch -p'
    git fetch -p --all $argv
end

function gg -d 'git graph'
    git log --all --decorate --oneline --graph $argv
end

function gl -d 'git logs'
    git log \
        --decorate \
        --graph \
        --pretty="%C(yellow)%h %C(reset)%s — %C(green)%an %C(reset)%C(dim)%cr%C(reset) %C(red)%C(bold)%d" \
        -10 \
        $argv
end

function gm -d 'git submodule'
    git submodule init && git submodule update $argv
end

function gp -d 'git pull'
    git pull $argv
end

function h -d htop
    htop $argv
end

function k -d kubectl
    kubectl $argv
end

function lg -d lazygit
    lazygit $argv
end

function n -d neofetch
    neofetch $argv
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

function p -d podman
    podman $argv
end

function pe -d 'podman exec -it'
    podman exec -it $argv
end

function pi -d 'podman images'
    podman images $argv
end

function pp -d 'podman image prune -f'
    podman image prune -f $argv
end

function pr -d 'podman run -it --rm'
    podman run -it --rm $argv
end

function t -d terrafrom
    terraform $argv
end

function tm -d tmux
    tmux $argv
end

function v -d nvim
    nvim $argv
end

function z -d zeditor
    zeditor $argv
end
