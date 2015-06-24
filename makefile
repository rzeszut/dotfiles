CFGROOT = $(shell pwd)
RM = rm -rf

# ------------------
# Config intallation
# ------------------
all: shell vim vimperator git

# shell configuration
shell: bash zsh tmux

bash: shell-scripts shell-common
	@echo "Installing bashrc ..."
	@ln -fs $(CFGROOT)/shell/bashrc ${HOME}/.bashrc

zsh: shell-scripts shell-common
	@bash install/install_zsh.sh

tmux:
	@echo "Installing tmux ..."
	@ln -fs $(CFGROOT)/config/tmux.conf ${HOME}/.tmux.conf

shell-scripts:
	@echo "Installing shell scripts ..."
	@mkdir -p ${HOME}/bin
	@ln -fs $(CFGROOT)/scripts ${HOME}/bin/scripts

shell-common:
	@echo "Installing common shell config ..."
	@ln -fs $(CFGROOT)/shell/shell-path.sh ${HOME}/.shell-path
	@ln -fs $(CFGROOT)/shell/shell-aliases.sh ${HOME}/.shell-aliases
	@ln -fs $(CFGROOT)/shell/shell-env.sh ${HOME}/.shell-env


# Vim configuration
vim: vim-xmodmap vim-ctags
	@bash install/install_vim.sh

vim-xmodmap:
	@echo "Installing Xmodmap ..."
	@ln -fs $(CFGROOT)/vim/xmodmap ${HOME}/.Xmodmap

vim-ctags:
	@echo "Installing ctags ..."
	@ln -fs $(CFGROOT)/vim/ctags ${HOME}/.ctags


# Vimperator configuration
vimperator:
	@bash install/install_vimperator.sh


# Git configuration
git:
	@echo "Installing gitconfig ..."
	@ln -fs $(CFGROOT)/config/gitconfig ${HOME}/.gitconfig


# -----------------------
# UNINSTALL configrations
# -----------------------
uninstall: uninstall-vim uninstall-vimperator uninstall-shell uninstall-git

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
	@echo "Uninstalling various configs ..."
	@unlink ${HOME}/.gitconfig

