require 'rubygems'
require 'bundler'

Bundler.require(:default)
require_relative 'app/endpoint'

run ApplicationController
