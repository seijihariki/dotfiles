files := bin .fonts .zshrc .zsh .oh-my-zsh .vimrc .vim .bashrc .bash_profile .inputrc .profile .zsh_themes .config .gdbinit .gitconfig .p10k.zsh
home := $(HOME)

pwd := $(shell pwd)
hmfiles := $(patsubst %,$(home)/%,$(files))
lcfiles := $(patsubst %,$(pwd)/%,$(files))

install: $(hmfiles) gitsub zsh

$(home)/%: $(pwd)/%
	ln -fs $< $@

gitsub:
	git submodule update --init

zsh:
	@ln -fs $(pwd)/.zsh_themes/* $(pwd)/.oh-my-zsh/themes/

clean:
	rm -rf $(hmfiles)

update:
	git pull --recurse-submodules
