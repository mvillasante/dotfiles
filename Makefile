all: install install_nvim

.PHONY: install

install:
	git clone --bare . $${HOME}/dotfiles.git
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} checkout
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} config --local status.showUntrackedFiles no
	git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
	
# pde:
#	mkdir --parent $${HOME}/repositorios
#	cd $${HOME}/repositorios && \
#	git clone https://github.com/devarops/pde.git && \
#	cd pde && \
#	make install

install_nvim:
	src/install_neovim.sh
