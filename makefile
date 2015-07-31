CFGROOT = $(shell pwd)
RM = rm -rf

# ------------------
# Config intallation
# ------------------
all: shell vim vimperator git ranger i3

shell:
	@bash install/install_shell.sh

vim:
	@bash install/install_vim.sh

vimperator:
	@bash install/install_vimperator.sh

git:
	@bash install/install_git.sh

ranger:
	@bash install/install_ranger.sh

i3:
	@bash install/install_i3.sh


# -----------------------
# UNINSTALL configrations
# -----------------------
uninstall: uninstall-vim uninstall-vimperator uninstall-shell uninstall-git uninstall-ranger uninstall-i3

uninstall-vim:
	@echo "Uninstalling Vim config ..."
	@${RM} ${HOME}/.vim
	@unlink ${HOME}/.vimrc
	@unlink ${HOME}/.Xmodmap
	@unlink ${HOME}/.ctags
	@unlink ${HOME}/.ycm_extra_conf.py

uninstall-vimperator:
	@echo "Uninstalling Vimperator config ..."
	@${RM} ${HOME}/.vimperator
	@unlink ${HOME}/.vimperatorrc

uninstall-shell:
	@echo "Uninstalling shell config ..."
	@unlink ${HOME}/.bashrc
	@unlink ${HOME}/.zshrc
	@unlink ${HOME}/.oh-my-zsh
	@unlink ${HOME}/.tmux.conf
	@unlink ${HOME}/.shell-path
	@unlink ${HOME}/.shell-aliases
	@unlink ${HOME}/.shell-env
	@unlink ${HOME}/bin/scripts

uninstall-git:
	@echo "Uninstalling git config ..."
	@unlink ${HOME}/.gitconfig

uninstall-ranger:
	@echo "Uninstalling ranger config ..."
	@${RM} ${HOME}/.config/ranger

uninstall-i3:
	@echo "Uninstalling i3 config ..."
	@unlink ${HOME}/.Xresources
	@${RM} ${HOME}/.i3
	@unlink ${HOME}/.i3status.conf

