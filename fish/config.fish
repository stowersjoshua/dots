rvm default

fish_add_path -a ~/.local/bin

alias vifish='vi ~/.config/fish/config.fish'
alias catfish='cat ~/.config/fish/config.fish'
alias sfish='. ~/.config/fish/config.fish'

alias pbcopy='xclip -r -select clipboard'
alias pbpaste='xclip -o -selection clipboard'

alias gs='git status'
alias gpob='git push origin (git branch --show-current)'
alias gccount='git log origin/HEAD..HEAD --oneline | wc -l'
alias r='rvm (cat .ruby-version)'

alias bers='foreman run bundle exec rails server -b 0.0.0.0'
alias berc='foreman run bundle exec rails console'
alias logs='tail -n 200 -f log/development.log'
alias activate='. ./venv/bin/activate.fish'
alias dc='docker-compose -f docker-compose.dev.yml'

alias cp2haml='echo (pbpaste) | html2haml --stdin | pbcopy'
alias wetter='curl -s wttr.in | sed -n "3,7p"'

alias pc_activate='. /home/joshua/Projects/Artzip/libraries/panocake/venv/bin/activate.fish'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Print absolute path to specified file
#
function abs -d "Print relative path as absolute"
  set -l options (fish_opt -o --short c --long copy)
  argparse $options -- $argv

  set -l local_path $argv[1]
  set -l absolute_path (readlink -e $local_path)

  if set -q _flag_copy
    echo $absolute_path | xclip -r -select clipboard
  end

  echo $absolute_path
end

# CD into most recently edited directory inside target folder
#
function cdn -d "Move to newest directory in path"
  set target (ls -1dt "$argv"/* | head -n 1)
  if test $status = 0
    cd $target
    pwd
  end
end

# CD into project folder with matching key word
function cdp -d "Move to associated project directory"
  set project "$argv"

  switch $project
  case f focus
    cd /home/joshua/Projects/Artzip/artzip_rails
    #rvm (cat .ruby-version)
  case art artzip
    cd /home/joshua/Projects/Artzip/artzip_rails
  case arb arbix
    cd /home/joshua/Projects/SimpleByte/arbix_rails
  case p pano panocake
    cd ~/Projects/Artzip/libraries/panocake
    . ./venv/bin/activate.fish
  case l leosa
    cd /home/joshua/Projects/Leosa/leosa_rails/
    rvm (cat .ruby-version)
  case a acc account accountability
    cd /home/joshua/Projects/Accountability/ 
  case s schema schema_scan
    cd ~/Projects/SchemaScan/schema_scan_rails
  case c cov
    cd /home/joshua/Projects/covid_alarm_rails/
    rvm (cat .ruby-version)
  case e est estimator
    cd /home/joshua/Projects/estimator_rails
    rvm (cat .ruby-version)
  case d doc awk doc_awk
    cd /home/joshua/Projects/DocAwk/
  case dot dots 
    cd ~/Projects/DotFiles
  end

  pwd
end

function vid-devs -d "List in-use webam devices"
  lsof -w | grep /dev/video | awk '{print $NF}' | uniq
end

# TODO:
#alias compress='set XZ_OPT="--memlimit-compress=80% --threads=0" tar tar cJf stitches_from_app.tar.xz *_pack'
#XZ_OPT="--memlimit-compress=80% --threads=0" tar cJf stitches_from_app.tar.xz stitches_*_pack

# Customize prompt

function fish_prompt -d "Write out the prompt"
    set -l last_status $status
    set -l dir_text (prompt_pwd)

    #set_color 50FA7B #6272A4
    set_color 6272A4
    #printf '%s ' (prompt_pwd)
    echo -n -s "$dir_text "

    if test $last_status -ne 0
      set_color FF5555
      #printf '[%s] ' ($last_status)
      echo "[$last_status] "
    end
end

fish_add_path -a /usr/pgsql-13/bin/  
fish_add_path -a /usr/local/cuda/bin
fish_add_path -a "$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"

