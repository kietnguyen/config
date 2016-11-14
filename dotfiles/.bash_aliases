# shortcut paths
learnet="$HOME/Projects/learnet/"
job="$HOME/Dropbox/kidhoki/Dropbox/Documents/Jobs"

# upgrade all packages with pip
function pipU {
  OUTDATED_LIST=`pip list --outdated`
  [[ -n $OUTDATED_LIST ]] && \
    (echo "$OUTDATED_LIST" | cut -d ' ' -f 1 | xargs -n1 pip install -U --user)
}


# start dropbox for kidhoki account
DROPBOX_USER='kidhoki'
alias dropbox-$DROPBOX_USER="HOME=/home/knguyen/Dropbox/$DROPBOX_USER/ /home/knguyen/Dropbox/$DROPBOX_USER/.dropbox-dist/dropboxd & disown"

# start dropbox for kietngyen86 account
DROPBOX_USER='kietnguyen86'
alias dropbox-$DROPBOX_USER="HOME=/home/knguyen/Dropbox/$DROPBOX_USER/ /home/knguyen/Dropbox/$DROPBOX_USER/.dropbox-dist/dropboxd & disown"


# upgrade all ubuntu packages
alias aptU='sudo apt update && sudo apt full-upgrade -y'
#alias aptU='sudo apt update && sudo aptitude safe-upgrade -y && sudo apt-get autoclean'

# upgrade user's global node packages
function nvmU {
  OLD_VERSION=`nvm current`
  LATEST_VERSION=$(nvm ls-remote | tail -n1 | sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g' | grep -Eo '[0-9v.]+')
  NEW_VERSION=${1:-$LATEST_VERSION}
  echo "nvm install $NEW_VERSION --reinstall-packages-from=$OLD_VERSION"
  nvm install $NEW_VERSION --reinstall-packages-from=$OLD_VERSION
  nvm use default
}

# interactive upgrade global packages
#function npmU {
#  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
#  do
#    npm -g install "$package"
#  done
#}
alias npmU='npm-check -u -g'
alias node='node --harmony'

# move swap data back to RAM
function swapclear {
  sudo swapoff -a
  sudo swapon -a
}

# copy with progress
#alias cp='rsync -avh --progress'
alias cp='rsync --archive --human-readable --info=progress2'
#alias mv='rsync --archive --human-readable --info=progress2 --remove-source-files'

# auto create parent directories when necessary
alias mkdir='mkdir -p'

# diff with unified context
alias diff='diff -u'

# rebuild virtualbox (no longer needed since v5.1.x)
#alias rebuild-vbox='sudo /sbin/rcvboxdrv setup'

# rebuild vmware
alias rebuild-vmware='sudo vmware-modconfig --console --install-all'

# rebuild vim YouCompleteMe
alias rebuild-ycm='python3 ${HOME}/.vim/bundle/YouCompleteMe/install.py --tern-completer --clang-completer'

# create quiz id and tokens
function quiz-tokens {
  LETTER_SET='adehmnrtABDEHMNQRT2347'
  QUIZ_ID=`tr -cd  ${LETTER_SET} < /dev/urandom | fold -w4 | head -n1`
  echo "Generate new tokens for quiz $QUIZ_ID"
  tr -cd ${LETTER_SET} < /dev/urandom | fold -w4 | head -n100 | sort > tokens-${QUIZ_ID}.txt
}

# search content inside all zip files
#alias zipgrep='for FILE in *.zip; do unzip -l "$FILE" done | grep -i'

# update Papirus Icon Theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk/commit/396a16fc85c128c4903e16e42a6ebb550f72833d
alias update-papirus='wget -O - https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk/master/install.sh | bash'
