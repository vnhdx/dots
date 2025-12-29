##
# Ez-Connect
##

function b -d btop
    btop $argv
end

function c -d wl-copy
    wl-copy $argv
end

# function cd -d zoxide
#     zoxide $argv
# end

function p -d wl-paste
    wl-paste $argv
end

function f -d fastfetch
    fastfetch $argv
end

function h -d htop
    htop $argv
end

function k -d kubectl
    kubectl $argv
end

function l -d lazygit
    lazygit $argv
end

function ll -d eza
    eza --group --header --group-directories-first --long --git $argv
end

function v -d nvim
    nvim $argv
end

# function zed -d zeditor
#     zeditor $argv
# end
