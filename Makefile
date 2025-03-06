all: install

.PHONY: install_compose install_container_runner copy_motd

install: install_compose install_container_runner copy_motd

DOCKER_CONFIG:=$${DOCKER_CONFIG:-$(HOME)/.docker}
install_compose:
	mkdir -p $(DOCKER_CONFIG)/cli-plugins
	curl -SL https://github.com/docker/compose/releases/download/v2.33.1/docker-compose-linux-x86_64 -o $(DOCKER_CONFIG)/cli-plugins/docker-compose
	chmod +x $(DOCKER_CONFIG)/cli-plugins/docker-compose

install_container_runner:
	pipx install container-runner==0.1.0
	
copy_motd:
	sudo cp /home/mvb/src/motd /etc/motd
	
install_nvim:
	src/install_neovim.sh
