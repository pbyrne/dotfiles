desc "Run once to initially set up the computer to use the dotfiles"
task :setup do
  puts "Doesn't do anything just yet"
  # here's the gist, though:
  # src/* each do |file|
  #   if ~/.file.exist?
  #     if it's a symlink?
  #       do nothing, we're good
  #     else
  #       back up to ~/.olddotfiles/file
  #   end
  #   symlink from src/file to ~/.file
  # end
end

desc "Update to the latest and greatest, and run any installs that need to happen"
task :update do
  sh "git pull"
  # to ensure that git has loaded the submodules
  sh "git submodule init"
  sh "git submodule update"
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

task :default => :update