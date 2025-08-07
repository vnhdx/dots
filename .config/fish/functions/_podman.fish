# function p -d podman
#     podman $argv
# end

function pms -d 'podman ps'
    podman ps $argv
end

function pmi -d 'podman image'
    podman images $argv
end

function pme -d 'podman exec'
    podman exec $argv
end

function pmr -d 'podman run'
    podman run $argv
end
