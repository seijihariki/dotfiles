files := bin .fonts .nvimrc .vimrc .vim .bashrc .bash_profile .inputrc .profile .config
home := $(HOME)

pwd := $(shell pwd)
hmfiles := $(patsubst %,$(home)/%,$(files))
lcfiles := $(patsubst %,$(pwd)/%,$(files))

install: $(hmfiles) gitsub

$(home)/%: $(pwd)/%
	ln -fs $< $@

gitsub:
	git submodule update --init --recursive
	
clean:
	rm -rf $(hmfiles)
