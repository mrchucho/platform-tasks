namespace :cop do

  desc 'Run the Lint cops'
  task :lint do
    configure do
      system """
      bundle exec rubocop --lint
      """
    end
  end

  desc 'Run the Rails cops'
  task :rails do
    configure do
      system """
      bundle exec rubocop --rails
      """
    end
  end

  task :setup do
    FileUtils.cp template_config_files, '.'
  end

  task :cleanup do
    FileUtils.rm config_files
  end

  def config_files
    %w(.rubocop.yml .rubocop-platform.yml rubocop-todo.yml)
  end

  def template_config_files
    config_files.map do |f|
      File.join(File.dirname(__FILE__), '..', '..', '..', f)
    end
  end

  # Don't use #invoke, these tasks must always be run
  def configure
    Rake::Task['cop:setup'].execute
    yield
  ensure
    Rake::Task['cop:cleanup'].execute
  end

end

desc 'Run rubocop'
task :cop => %w(cop:lint cop:rails)
