#!/usr/bin/env bash

debug_enabled=true
command=
geometry=
output=

main() {
    command="$1"
    if [[ -z ${command} || ${command} == "-h" ]]; then
        help
        exit 0
    fi

    local opts="$2"
    while true; do
        case ${opts} in
            -h | --help)
                help
                exit 0;;
            -r | --record)
                command='record'
                shift;;
            -s | --screenshot)
                command='screenshot'
                shift;;
            -w | --window)
                sel='window'
                shift;;
            -m | --monitor)
                sel='monitor'
                shift;;
            -g | --geometry)
                sel='region'
                shift;;
            -o | --output)
                output="$1"
                shift;;
            *)
                echo "Invalid option: $1"
                help
                exit 1;;
        esac
    done

    if [[ -z ${command} ]]; then
        echo "Error: No command specified"
        help
        exit 1
    fi
}

help() {
   cat <<EOF
Usage: hypr-cap <command> [options]

Commands:
    screenshot          take a screenshot of the active window
    record              record the active window

Options:
    -s, --selection     select a window | monitor | region, default is window
    -o, --output        the output directory of the capture file, default is the current directory
    -c, --clipboard     copy output to the clipboard

Dependencies: slurp, grim, wf-recorder, wl-clipboard
EOF
}


notify() {
    args=$1
    msg=$2
    notify-send ${args} ${2}
}

debug() {
    if [[ ${debug_enabled} == true ]]; then
        echo "$@"
    fi
}

# Get the active window geometry.
# Results: x,y wxh
get_window_geometry() {
    local mode="$1"

    window=$(hyprctl -j activewindow)
    x=$(echo ${window} | jq '.at[0]')
    y=$(echo ${window} | jq '.at[1]')
    w=$(echo ${window} | jq '.size[0]')
    h=$(echo ${window} | jq '.size[1]')

    echo "${x},${y} ${w}x${h}"
}

shot() {
    local sel="$1"
    local dir="${output}"
    if [[ -z ${dir} ]]; then
        echo "Error: Output directory not specified"
        exit 1
    fi

    slurp
    geo=$(get_window_geometry)
    filename="screen-shot-$(date '+%Y-%m-%d_%H-%M-%S').jpg"
    grim -g "${geo}" -f "${output}/${filename}.jpg"
}

record_window() {
    local dir="${output}"
    if [[ -z ${dir} ]]; then
        echo "Error: Output directory not specified"
        exit 1
    fi

    slurp
    geo=$(get_window_geometry)
    filename="screen-record-$(date '+%Y-%m-%d_%H-%M-%S').mp4"
    wf-recorder -g "${geo}" -f "${output}/${filename}.mp4" -y
}

# h

# notify -w 'Hello'
# slurp
# geo=$(get_window_geometry)


# echo "geo=${geo}"
# wf-recorder -g "${geo}" -f ~/Videos/screen_record.mp4 -y



main $@
