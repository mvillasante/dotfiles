all: install copy_motd

.PHONY: install

install: bare_clone copy_motd

bare_clone:
	git clone --bare . $${HOME}/dotfiles.git
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} checkout
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} config --local status.showUntrackedFiles no
	git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
	chown -R mvb:mvb $${HOME}

copy_motd:
	cp ./src/motd /etc/motd
	
install_nvim:
	src/install_neovim.sh
