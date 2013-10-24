namespace :setup do

  desc 'Copy sample config files'
  task :config_files do
    Dir.glob('config/*.yml.sample') do |sample|
      config = sample.sub(/\.sample$/, '')
      if File.exists?(config)
        error = 'File exists'
        %x{diff -q #{sample} #{config} 1>/dev/null}
        if $?.exitstatus == 1 # files differ
          backup = config.sub(/\.yml$/,
                              ".#{Time.now.strftime('%Y%m%d%H%M%S')}.yml")
          printf "\e[00;33mBackup\e[00m   %s (%s)\n" % [config, error]
          %x{cp #{config} #{backup}}
          printf "\e[00;32mCopied\e[00m   %s\n" % [sample]
          %x{cp #{sample} #{config}}
        else
          printf "\e[00;33mSkipping\e[00m %s (%s)\n" % [sample, error]
        end
      else
        printf "\e[00;32mCopied\e[00m  %s\n" % [sample]
        %x{cp #{sample} #{config}}
      end
    end
  end

end

desc 'Run all setup tasks'
task :setup => 'setup:config_files'
