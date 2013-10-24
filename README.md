# Platform::Tasks

Common development setup and CI tasks.

## Installation

Add this line to your application's Gemfile:

    gem 'platform-tasks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install platform-tasks

## Development Tasks
* **setup** Copy all sample YAML files to their equivalent config file. If a
  modified version of the config file exists, it will be backed up first.

## CI Tasks
* **ci** Run both the rspec and cucumber tasks
* **ci::rspec** Run rspec in a manner expected by Jenkins
* **ci::cucumber** Run cucumber in a manner expected by Jenkins

## Customization
To customize the Development Setup task, the following hooks are provided:
```
  rake setup::custom::before
  rake setup::custom::after
```
Either task (or both) can be added to your project ```lib/tasks/setup.rake```
