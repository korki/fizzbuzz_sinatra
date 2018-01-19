require 'bundler'
require 'rubygems'

Bundler.require(:default, :test)
require 'rack/test'
require 'pry'

require File.join(File.dirname(__FILE__), '..', 'app', 'endpoint.rb')

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.include Rack::Test::Methods
end
