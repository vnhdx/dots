##
# Ez-Connect
##

function b -d btop
    btop $argv
end

function c -d 'xclip to clipboard'
    xclip -selection clipboard $argv
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

# function m -d mise
#     mise $argv
# end

function t -d terrafrom
    terraform $argv
end

function tm -d tmux
    tmux $argv
end

function v -d nvim
    nvim $argv
end

# function z -d zed
#     zed $argv
# end
