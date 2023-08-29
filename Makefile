update:
	bin/update

install:
	bin/install_homebrew
	bin/install_symlinks
	bin/install_vundle
	bin/update

install-linux:
	bin/install_symlinks
	bin/install_vundle
	bin/install_rust
	bin/update
