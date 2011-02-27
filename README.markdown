# Installation
To begin using, check out the project like so:

    git clone http://github.com/pbyrne/dotfiles.git ~/workspace/dotfiles

This package assumes that you have Ruby and Rake installed for automation. It was built for use with [MacVom 7.3](http://code.google.com/p/macvim/), but could theoretically be used for just about any distribution.

# Usage

The first time you use this, use `rake setup` to back up your current dotfiles. Then, going forward, use `rake update` to update the latest changes. A good ol' `git pull` would do the trick, too, for most changes.

# TODO

* Set up Vim the way I want
* Build the Rakefile to support these commands
* Build `rake setup` command.
  * back up existing files
  * set up symlinks for files in the repo
  * copy (unless it already exists) config.sample.yml to config.yml
* Build `rake update` command.
* `rake setup:work`, `rake setup:work_server` and the like for customized configs
* Build a sample config.sample.yml (and ignore config.yml) to include secret information to place into the files (SSH ports, git keys, etc.)
