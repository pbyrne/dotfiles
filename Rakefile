require 'rake'
require 'date'
require 'yaml'

desc "Run once to initially set up the computer to use the dotfiles"
task :setup => ["setup:setup"]

namespace :setup do
  task :setup do
    Rake::Task["setup:symlink_dotfiles"].invoke
    Rake::Task["setup:symlink_private_dotfiles"].invoke
    Rake::Task["setup:symlink_custom_zsh"].invoke
    Rake::Task["setup:mac_defaults"].invoke
  end

  task :symlink_dotfiles do
    # inspoired heavily from https://github.com/henrik/dotfiles/blob/master/Rakefile and https://github.com/ryanb/dotfiles/blob/master/Rakefile
    Dir["src/*"].each do |file|
      # full path to file
      source = File.join(Dir.pwd, file)
      # just the file name
      basename = File.basename(file)
      # where we want it to be
      destination = File.expand_path("~/.#{basename}")

      conditionally_symlink(source, destination)
    end
  end

  desc "Set up private symlinks stored in ~/Dropbox/dotfiles"
  task :symlink_private_dotfiles do
    dotfiles_location = "~/Dropbox/dotfiles"
    manifest_path = "#{dotfiles_location}/manifest.yml"
    full_path = File.expand_path(manifest_path)
    if File.exist?(full_path)
      manifest = YAML.load_file(full_path)
      manifest.each do |orig, dest|
        conditionally_symlink("#{dotfiles_location}/#{orig}", "~/#{dest}")
      end
    else
      puts "  #{manifest_path} does not exist, cannot continue"
    end
  end

  desc "Symlink Oh My Zsh! customizations"
  task :symlink_custom_zsh do
    source = File.join Dir.pwd, "zsh" # zsh in the root of the repo
    destination = File.expand_path "~/.oh-my-zsh/custom"

    conditionally_symlink source, destination
  end

  desc "Set up Mac defaults"
  task :mac_defaults do
    if RUBY_PLATFORM.include? "darwin"
      sh "scripts/mac_defaults.sh"
    end
  end
end

desc "Install Oh My ZSH"
task :install_zsh do
  sh "curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
end


# TODO express the other update commands in separate dependant rake tasks
desc "Update to the latest and greatest, and run any installs that need to happen"
task :update => [:update_tm] do
  sh "git pull"
  # to ensure that git has loaded the submodules
  sh "git submodule update --init"
  sh "git submodule foreach git pull origin master"
end

desc "Run the install script for Command-T"
task :install_command_t do
  # lifted from the Janus setup, https://github.com/carlhuda/janus/blob/master/Rakefile
  Dir.chdir "src/vim/bundle/command-t/ruby/command-t" do
    if File.exists?("/usr/bin/ruby") # prefer system rubies
      sh "/usr/bin/ruby extconf.rb"
    elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
      sh "rvm system ruby extconf.rb"
    else
      raise StandardError, "No version of Ruby installed"
    end
    sh "make clean && make"
  end
end

desc "Update TextMate Bundles and PlugIns checked out with git"
task :update_tm do
  %w(
    ~/Library/Application\ Support/TextMate/Bundles
    ~/Library/Application\ Support/TextMate/PlugIns
  ).each do |dir|
    `ls '#{File.expand_path(dir)}'`.split("\n").each do |subdir|
      gitdir = File.expand_path(File.join(dir, subdir))
      if File.directory?(File.join(gitdir, ".git"))
        # TODO pretty up this output. it uses the entire path, which looks ugly
        # but avoid Dir.chdir, since that changes the current directory, which i don't want
        sh "cd '#{gitdir}' && git pull"
      end
    end
  end

  # return to the directory where rake was called
  sh "cd '#{ENV['PWD']}'"
end

# just running `rake` runs `rake update`
task :default => :update

def conditionally_symlink(source, destination)
  source = File.expand_path(source)
  destination = File.expand_path(destination)
  if File.exist?(source)
    if File.symlink?(destination)
      symlink_to = File.readlink(destination)
      if symlink_to == source
        puts "  #{destination} already symlinked, nothing to do"
      else
        puts "  relinking #{destination} from #{symlink_to} to #{source}"
        FileUtils.rm(destination)
        FileUtils.ln_s(source, destination)
      end
    elsif File.exist?(destination)
      # tack on today's date in YYYYMMDD
      backup_location = "#{destination}.#{Date.today.strftime("%Y%m%d")}"
      puts "  #{destination} already exists. Backing up to #{backup_location}"
      FileUtils.mv(destination, backup_location)
      FileUtils.ln_s(source, destination)
    else
      puts "  creating symlink for #{destination}"
      FileUtils.ln_s(source, destination)
    end
  else
    puts "  #{destination} doesn't exist, cannot create symlink"
  end
end
