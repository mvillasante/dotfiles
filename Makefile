all: install copy_motd

.PHONY: install

install: copy_motd
	git clone --bare . $${HOME}/dotfiles.git
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} checkout
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} config --local status.showUntrackedFiles no
	git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
	chown -R mvb:mvb $${HOME}

copy_motd:
	mkdir /etc/motd
	cp src/motd /etc/motd
	
# pde:
#	mkdir --parent $${HOME}/repositorios
#	cd $${HOME}/repositorios && \
#	git clone https://github.com/devarops/pde.git && \
#	cd pde && \
#	make install

install_nvim:
	src/install_neovim.sh
