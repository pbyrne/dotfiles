# Installation
To begin using, check out the project like so:

    git clone http://github.com/pbyrne/dotfiles.git ~/workspace/dotfiles

This package assumes that you have Ruby and Rake installed for automation. It was built for use with [MacVom 7.3] 

# Usage

The first time you use this, use `rake setup` to back up your current dotfiles. Then, going forward, use `rake` or `rake update` to update the latest changes. A good ol' `git pull` would do the trick, too, for most changes.

# TODO

* Drop in my current files
* Set up Vim the way I want
* Build the Rakefile to support these commands
* Build `rake setup` command.
* Build `rake update` command.
* `rake setup:work`, `rake setup:work_server` and the like for customized configs
