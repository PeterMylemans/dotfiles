#!/usr/bin/env bash

# Usage: curl -fsSL https://raw.githubusercontent.com/petermylemans/dotfiles/main/bin/install-dotfiles.sh | bash

git clone --bare git@github.com:petermylemans/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .config-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
