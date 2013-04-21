require 'simplecov'
SimpleCov.add_filter "spec"
SimpleCov.start

require 'rubygems'
require 'bundler/setup'
require 'fuji'
require 'ostruct'

RSpec.configure do |config|
  # some (optional) config here
end