files := .vimrc .vim .bashrc .bash_profile .inputrc .profile
home := $(HOME)

pwd := $(shell pwd)
hmfiles := $(patsubst %,$(home)/%,$(files))
lcfiles := $(patsubst %,$(pwd)/%,$(files))

install: $(hmfiles)

$(home)/%: $(pwd)/%
	ln -fs $< $@
	
clean:
	rm -rf $(hmfiles)
