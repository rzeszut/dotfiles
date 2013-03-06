CFGROOT = $(shell pwd)

all: bash emacs fonts git mplayer octave sqlite taffybar vim xinitrc xmonad xresources

bash:
	@echo "Installing bashrc..."
	@ln -fs $(CFGROOT)/bashrc ${HOME}/.bashrc

conkeror:
	@echo "Installing conkeror..."
	@ln -fs $(CFGROOT)/conkerorrc ${HOME}/.conkerorrc

emacs:
	@echo "Installing emacs..."
	@ln -fs $(CFGROOT)/emacs ${HOME}/.emacs.d

fonts:
	@echo "Installing fonts.conf..."
	@ln -fs $(CFGROOT)fonts.conf ${HOME}/.fonts.conf

git:
	@echo "Installing gitconfig..."
	@ln -fs $(CFGROOT)/gitconfig ${HOME}/.gitconfig

mplayer:
	@echo "Installing mplayer..."
	@ln -fs $(CFGROOT)/mplayer ${HOME}/.mplayer

octave:
	@echo "Installing octave..."
	@ln -fs $(CFGROOT)/octaverc ${HOME}/.octaverc

sqlite:
	@echo "Installing sqlite..."
	@ln -fs $(CFGROOT)/sqliterc ${HOME}/.sqliterc

taffybar:
	@echo "Installing taffybar..."
	@mkdir -p ${HOME}/.config
	@ln -fs $(CFGROOT)/taffybar ${HOME}/.config/taffybar

vim: git
	@echo "Installing vim..."
	@ln -fs $(CFGROOT)/vim/vimrc ${HOME}/.vimrc
	@ln -fs $(CFGROOT)/vim/vim ${HOME}/.vim
	@echo "Installing vundle..."
	@mkdir -p ${HOME}/.vim/bundle
	@git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

xinitrc:
	@echo "Installing xinitrc..."
	@ln -fs $(CFGROOT)/xinitrc ${HOME}/.xinitrc
	@ln -fs $(CFGROOT)/xinitrc ${HOME}/.xsession

xmonad: taffybar xinitrc
	@echo "Installing xmonad..."
	@ln -fs $(CFGROOT)/xmonad ${HOME}/.xmonad

xresources:
	@echo "Installing Xresources..."
	@ln -fs $(CFGROOT)/xresources ${HOME}/.Xresources
	@xrdb ${HOME}/.Xresources

# -----------------------------------------------------------

uninstall:
	@echo "Removing all the links..."
	@unlink ${HOME}/.bashrc
	@unlink ${HOME}/.emacs.d
	@unlink ${HOME}/.fonts.conf
	@unlink ${HOME}/.gitconfig
	@unlink ${HOME}/.octaverc
	@unlink ${HOME}/.sqliterc
	@unlink ${HOME}/.config/taffybar
	@unlink ${HOME}/.vim
	@unlink ${HOME}/.vimrc
	@unlink ${HOME}/.xinitrc
	@unlink ${HOME}/.xsession
	@unlink ${HOME}/.xmonad
	@unlink ${HOME}/.Xresources

# -----------------------------------------------------------

.PHONY: restart-xmonad restart-taffybar update-xresources

restart-xmonad:
	@echo "Restarting xmonad..."
	@kill -9 `ps -e | grep taffybar | cut -d ' ' -f2`
	@xmonad --recompile && xmonad --restart

restart-taffybar:
	@echo "Restarting taffybar..."
	@kill -9 `ps -e | grep taffybar | cut -d ' ' -f2`
	@taffybar &

update-xresources:
	@echo "Updating Xresources..."
	@xrdb ${HOME}/.Xresources

