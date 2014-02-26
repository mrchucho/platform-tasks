require 'platform/tasks/version'

module Platform
  module Tasks
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'platform/tasks/ci.rake'
        load 'platform/tasks/setup.rake'
        load 'platform/tasks/cop.rake'
      end
    end
  end
end
