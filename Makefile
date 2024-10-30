all: install install_compose copy_motd

.PHONY: install

install: bare_clone copy_motd

bare_clone:
	git clone --bare . $${HOME}/dotfiles.git
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} checkout
	git --git-dir=$${HOME}/dotfiles.git --work-tree=$${HOME} config --local status.showUntrackedFiles no
	git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
	chown -R mvb:mvb $${HOME}

install_compose:
	DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
	mkdir -p $DOCKER_CONFIG/cli-plugins
	curl -SL https://github.com/docker/compose/releases/download/v2.29.4/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
	chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
	
copy_motd:
	cp $${HOME}/src/motd /etc/motd
	
install_nvim:
	src/install_neovim.sh
