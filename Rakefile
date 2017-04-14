require 'date'
require 'pathname'
require 'rake'
require 'yaml'

PRIVATE_DOTFILES = Pathname.new("~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles").expand_path

desc "Run once to initially set up the computer to use the dotfiles"
task :setup => ["setup:setup"]

namespace :setup do
  task :setup do
    Rake::Task["setup:symlink_dotfiles"].invoke
    Rake::Task["setup:symlink_private_dotfiles"].invoke
    Rake::Task["setup:symlink_shared_application_support"].invoke
    Rake::Task["setup:symlink_bin"].invoke
    Rake::Task["setup:mac_defaults"].invoke
    Rake::Task["setup:install_vundle"].invoke
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

  task :symlink_bin do
    conditionally_symlink(File.join(Dir.pwd, "src", "bin"), File.expand_path("~/bin"))
  end

  desc "Set up private symlinks stored in #{PRIVATE_DOTFILES}"
  task :symlink_private_dotfiles do
    manifest_path = PRIVATE_DOTFILES.join("manifest.yml")
    if File.exist?(manifest_path)
      manifest = YAML.load_file(manifest_path)
      manifest.each do |orig, dest|
        conditionally_symlink("#{PRIVATE_DOTFILES}/#{orig}", "~/#{dest}")
      end
    else
      puts "  #{manifest_path} does not exist, cannot continue"
    end
  end

  desc "Symlink shared Application Support directories"
  task :symlink_shared_application_support do
    shared_app_support_path = File.expand_path("~/Dropbox/Library/Application Support")
    if File.exist?(shared_app_support_path)
      Dir["#{shared_app_support_path}/*"].each do |orig|
        dest = File.expand_path("~/Library/Application Support/#{File.basename(orig)}")
        conditionally_symlink(orig, dest)
      end
    else
      puts "  #{shared_app_support_path} does not exist, skipping"
    end
  end

  desc "Set up Mac defaults"
  task :mac_defaults do
    if RUBY_PLATFORM.include? "darwin"
      sh "scripts/mac_defaults.sh"
    end
  end

  desc "Set up vundle so that the Vim Bundle command works"
  task :install_vundle do
    unless File.directory? File.expand_path "~/.vim/bundle/vundle/.git"
      sh "git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim"
    end
  end
end


desc "Update to the latest and greatest, and run any installs that need to happen"
task :update do
  sh "git pull"
  # to ensure that git has loaded the submodules
  sh "vim +PluginInstall! +qall"
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
