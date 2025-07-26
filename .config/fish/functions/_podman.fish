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
