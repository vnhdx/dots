##
# Ez-Connect
##

# Load functions
set -l files _alias.fish _ffmpeg.fish _git.fish _podman.fish _util.fish

for file in $files
    set -l filename ~/.config/fish/functions/$file
    if test -f $filename
        source $filename
    end
end
