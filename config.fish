set --universal fish_greeting

# Add Hugin/Perl components to PATH
set -gx PATH $PATH /Applications/Hugin/HuginStitchProject.app/Contents/MacOS/
set -gx PATH $PATH /Applications/Hugin/Hugin.app/Contents/MacOS
set -gx PATH $PATH ~/perl5/bin

rvm default

# Helpful aliases
alias vimfish 'vim ~/.config/fish/config.fish'
alias sfish '. ~/.config/fish/config.fish'
alias gs 'git status'
alias gb 'git branch --list | grep "* " | cut -c 3-'

# Custom functions
function berc
  bundle exec rails console
end

function bers
  bundle exec rails server
end

function gpob
  git push origin (gb)
end
