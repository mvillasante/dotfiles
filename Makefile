all: install

.PHONY: install_pi copy_motd

install: copy_motd install_pi

install_pi:
	curl -fsSL https://pi.dev/install.sh | sh

copy_motd:
	sudo cp /home/mvb/src/motd /etc/motd
	
