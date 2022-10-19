setup: install-esentials install-tools install-php install-configs nvim-packer-sync

container-build:
	docker build -t alpine-dev -f alpine-dev.Dockerfile \
		--build-arg PUID=$$(id -u) \
		--build-arg PGID=$$(id -g) \
		.

container-bash:
	docker run -it --rm alpine-dev

container-bash-mount:
	docker run -it --rm -v $$(pwd):/project alpine-dev

install-configs:
	ln -s $$(pwd)/.config $${HOME}/.config
	ln -s $$(pwd)/home_files/.bashrc $${HOME}/.bashrc
	ln -s $$(pwd)/home_files/.bash_aliases $${HOME}/.bash_aliases

install-esentials:
	apk add --no-cache bash bash-completion sudo make git curl

install-tools:
	apk add --no-cache tmux lf neovim fzf ripgrep lazygit

install-extra:
	apk add --no-cache w3m newsboat

install-js:
	apk add --no-cache npm

install-php:
	apk add --no-cache php composer

install-intelephense: install-js
	npm i -g intelephense

nvim-packer-install:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim-packer-sync:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
