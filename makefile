CFGROOT = $(shell pwd)
RM = rm -rf

# ------------------
# Config intallation
# ------------------
all: emacs bash vim wm mplayer octave git sqlite

# emacs configuration
emacs:
	@echo "Installing emacs ..."
	@ln -fs $(CFGROOT)/emacs ${HOME}/.emacs.d


# shell configuration
bash: shell-scripts shell-common
	@echo "Installing bashrc ..."
	@ln -fs $(CFGROOT)/shell/bashrc ${HOME}/.bashrc

zsh: shell-scripts shell-common
	@bash scripts/install/install_zsh.sh

shell-scripts:
	@echo "Installing shell scripts ..."
	@mkdir -p ${HOME}/bin
	@ln -fs $(CFGROOT)/scripts ${HOME}/bin/scripts

shell-common:
	@echo "Installing common shell config ..."
	@ln -fs $(CFGROOT)/shell/shell-path.sh ${HOME}/.shell-path
	@ln -fs $(CFGROOT)/shell/shell-aliases.sh ${HOME}/.shell-aliases

# Vim configuration
vim: vim-xmodmap vim-ctags
	@bash scripts/install/install_vim.sh

vim-xmodmap:
	@echo "Installing Xmodmap ..."
	@ln -fs $(CFGROOT)/vim/xmodmap ${HOME}/.Xmodmap
	@xmodmap ${HOME}/.Xmodmap

vim-ctags:
	@echo "Installing ctags ..."
	@ln -fs $(CFGROOT)/vim/ctags ${HOME}/.ctags


# WM - xmonad configuration
wm: wm-xinitrc wm-xmonad wm-taffybar wm-xresources wm-fonts

wm-xinitrc:
	@echo "Installing xinitrc ..."
	@ln -fs $(CFGROOT)/wm/xinitrc ${HOME}/.xinitrc
	@ln -fs $(CFGROOT)/wm/xinitrc ${HOME}/.xsession

wm-taffybar:
	@echo "Installing taffybar ..."
	@mkdir -p ${HOME}/.config
	@ln -fs $(CFGROOT)/wm/taffybar ${HOME}/.config/taffybar

wm-xmonad: wm-taffybar wm-xinitrc
	@echo "Installing xmonad ..."
	@ln -fs $(CFGROOT)/wm/xmonad ${HOME}/.xmonad

wm-xresources:
	@echo "Installing Xresources ..."
	@ln -fs $(CFGROOT)/wm/xresources ${HOME}/.Xresources
	@xrdb ${HOME}/.Xresources

wm-fonts:
	@echo "Installing fonts.conf ..."
	@ln -fs $(CFGROOT)/wm/fonts.conf ${HOME}/.fonts.conf


# various
git:
	@echo "Installing gitconfig ..."
	@ln -fs $(CFGROOT)/various/gitconfig ${HOME}/.gitconfig

mplayer:
	@echo "Installing mplayer ..."
	@ln -fs $(CFGROOT)/various/mplayer ${HOME}/.mplayer

octave:
	@echo "Installing octave ..."
	@ln -fs $(CFGROOT)/various/octaverc ${HOME}/.octaverc

sqlite:
	@echo "Installing sqlite ..."
	@ln -fs $(CFGROOT)/various/sqliterc ${HOME}/.sqliterc


# -----------------------
# UNINSTALL configrations
# -----------------------
uninstall: uninstall-wm uninstall-vim uninstall-shell uninstall-emacs uninstall-various

uninstall-wm:
	@echo "Uninstalling WM config ..."
	@unlink ${HOME}/.xinitrc
	@unlink ${HOME}/.xsession
	@unlink ${HOME}/.config/taffybar
	@unlink ${HOME}/.xmonad
	@unlink ${HOME}/.Xresources
	@unlink ${HOME}/.fonts.conf

uninstall-vim:
	@echo "Uninstalling Vim config ..."
	@${RM} ${HOME}/.vim
	@unlink ${HOME}/.vimrc
	@unlink ${HOME}/.Xmodmap
	@unlink ${HOME}/.ctags

uninstall-shell:
	@echo "Uninstalling shell config ..."
	@unlink ${HOME}/.bashrc
	@unlink ${HOME}/bin/scripts

uninstall-emacs:
	@echo "Uninstalling Emacs config ..."
	@unlink ${HOME}/.emacs.d

uninstall-various:
	@echo "Uninstalling various configs ..."
	@unlink ${HOME}/.gitconfig
	@unlink ${HOME}/.octaverc
	@unlink ${HOME}/.sqliterc
	@unlink ${HOME}/.mplayer


# ----------------
# Phony WM targets
# ----------------
.PHONY: restart-xmonad restart-taffybar update-xresources

restart-xmonad:
	@echo "Restarting xmonad ..."
	@kill -9 `ps -e | grep taffybar | cut -d ' ' -f2`
	@xmonad --recompile && xmonad --restart

restart-taffybar:
	@echo "Restarting taffybar ..."
	@kill -9 `ps -e | grep taffybar | cut -d ' ' -f2`
	@taffybar &

update-xresources:
	@echo "Updating Xresources ..."
	@xrdb ${HOME}/.Xresources

