# Installation
To begin using, check out the project like so:

    git clone http://github.com/pbyrne/dotfiles.git ~/workspace/dotfiles

This package assumes that you have Ruby and Rake installed for automation. It was built for use with [MacVom 7.3](http://code.google.com/p/macvim/), but could theoretically be used for just about any distribution.

# Usage

The first time you use this, use `rake setup` to back up your current dotfiles. Then, going forward, use `rake update` to update the latest changes. A good ol' `git pull` would do the trick, too, for most changes.

# Additional Commands

`rake install_command_t`

Installs the Command-T Vim binaries.

`rake set_up_private_symlinks`

Symlinks private files stored in ~/Dropbox/dotfiles as described in
~/Dropbox/dotfiles/manifest.yml. A sample is below to symlink gitconfig,
hgrc, and TextMate bundles and plugins. The value to the left of `:` is
the original file relative to ~/Dropbox/dotfiles; the value to the right of `:`
is the destination, relative to `~`.

    ---
    hgrc: .hgrc
    gitconfig: .gitconfig
    TextMate/Bundles: Library/Application Support/TextMate/Bundles
    TextMate/PlugIns: Library/Application Support/TextMate/PlugIns

# TODO

* Update `rake set_up_private_symlinks` to accept an environment variable if the path is different than ~/Dropbox/dotfiles.

