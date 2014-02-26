namespace :cop do

  desc 'Run all cops'
  task :all do
    configure do
      system """
      bundle exec rubocop -D --rails
      """
    end
  end

  desc 'Run only the Lint cops'
  task :lint do
    configure do
      system """
      bundle exec rubocop -D --lint
      """
    end
  end

  desc 'Run rubocop for CI (specify results output file w/ OUTPUT)'
  task :ci do
    configure do
      system """
      bundle exec rubocop --require rubocop/formatter/checkstyle_formatter \
                          --format Rubocop::Formatter::CheckstyleFormatter \
                          --no-color --rails #{output}
      """
    end
  end

  task :setup do
    FileUtils.cp template_config_files, '.'
  end

  task :cleanup do
    FileUtils.rm config_files
  end

  def output
    ENV['OUTPUT'].blank? ? nil : "--out #{ENV['OUTPUT']}"
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

desc 'Run rubocop with All cops'
task :cop => %w(cop:all)
