if which nvim > /dev/null 2>&1
    set -U EDITOR nvim
else
    set -U EDITOR vim
end
