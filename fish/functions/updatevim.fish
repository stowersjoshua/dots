# From: https://github.com/VundleVim/Vundle.vim/wiki#i-dont-use-a-posix-shell-ie-bashsh

function updatevim
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end

