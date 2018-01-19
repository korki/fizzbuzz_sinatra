require 'rspec/core/rake_task'
require 'bundler'
Bundler.setup(:default)

require 'pry'
require_relative 'app/endpoint'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
