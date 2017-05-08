files := bin .fonts .nvimrc .vimrc .vim .bashrc .bash_profile .inputrc .profile .config
home := $(HOME)

pwd := $(shell pwd)
hmfiles := $(patsubst %,$(home)/%,$(files))
lcfiles := $(patsubst %,$(pwd)/%,$(files))

install: $(hmfiles) gitsub

nvim:
	mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
	ln -s ~/.vim $XDG_CONFIG_HOME/nvim
	ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

$(home)/%: $(pwd)/%
	ln -fs $< $@

gitsub:
	git submodule update --init --recursive
	
clean:
	rm -rf $(hmfiles)
