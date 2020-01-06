#!/bin/bash

echo "checking for a stow install..";
# check stow is installed
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' stow | grep "install ok installed");
# if not, install it
if [ "" == "$PKG_OK" ]; then
	echo "no stow package found. trying to install..";
	sudo apt --force-yes --yes install stow;
	echo "installed GNU stow."
else
	echo "stow install found.";
fi

echo "stowing the dotfiles into the home directory.";
# run stow on vim, tmux and bash folders
cd $HOME/dotfiles
stow -t $HOME vim;
stow -t $HOME tmux;
stow -t $HOME bash;

# download tmux plugin manager
echo "downloading the tmux plugin manager.";
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

echo "installing whatever plugins are in tmux.conf.";
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh
