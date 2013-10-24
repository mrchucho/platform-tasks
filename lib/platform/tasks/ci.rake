namespace :ci do

  desc 'Setup and run rspec'
  task :rspec do
    %x{
    mkdir -p spec/reports
    mkdir -p coverage/rcov
    COVERAGE=true bundle exec rspec -r `bundle show ci_reporter`/lib/ci/reporter/rake/rspec_loader.rb -f CI::Reporter::RSpec spec
    }
  end

  desc 'Setup and run cucumber'
  task :cucumber do
    %x{
    mkdir -p features/reports
    COVERAGE=true bundle exec cucumber --format html --out features/reports/features.html --format junit --out features/reports
    }
  end

end

desc 'Run rspec and cucumber'
task :ci => %w(ci:rspec ci:cucumber)

