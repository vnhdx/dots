##
# Ez-Connect
##

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
