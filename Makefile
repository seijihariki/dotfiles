files := bin .fonts .vimrc .vim .bashrc .bash_profile .inputrc .profile
home := $(HOME)

pwd := $(shell pwd)
hmfiles := $(patsubst %,$(home)/%,$(files))
lcfiles := $(patsubst %,$(pwd)/%,$(files))

install: $(hmfiles) gitsub

$(home)/%: $(pwd)/%
	ln -fs $< $@

gitsub:
	git submodule update --init
	
clean:
	rm -rf $(hmfiles)
