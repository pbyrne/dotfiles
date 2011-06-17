require 'rake'
require 'date'
require 'yaml'

desc "Run once to initially set up the computer to use the dotfiles"
task :setup do
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

  # to get git to recognize the gitexcludes file, which is used so all
  # the tags files created in the pathogen plugins don't keep showing up
  # as "untracked changes"
  sh "git config --global core.excludesfile '~/.gitexcludes'"
end

desc "Set up private symlinks stored in ~/Dropbox/dotfiles"
task :set_up_private_symlinks do
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

desc "Update to the latest and greatest, and run any installs that need to happen"
task :update do
  sh "git pull"
  # to ensure that git has loaded the submodules
  sh "git submodule update --init"
  sh "git submodule foreach git checkout master" # to ensure that you're all checked out and the update command actually does something
  sh "git submodule foreach git pull"
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
