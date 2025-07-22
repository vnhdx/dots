#!/usr/bin/env bash

output="$HOME/Videos/record.mp4"

if pidof wf-recorder >/dev/null; then
	pkill -SIGINT wf-recorder

	makoctl dismiss
	notify-send -t 5000 'Record stop' "Recorded in ${output}"
else
	notify-send -u critical 'Record start'
	wf-recorder -g "$(slurp)" \
		-a -c libx265 --muxer=mp4 \
		-f "${output}" \
		-- -crf 28 -preset fast -c:a aac -b:a 128k
fi
