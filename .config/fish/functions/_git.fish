##
# Ez-Connect
##

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
