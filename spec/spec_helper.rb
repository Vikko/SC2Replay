ENV["RAILS_ENV"] ||= 'test'

require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rspec/autorun'
require 'rspec/rails'

Fabrication.configure do |config|
  fabricator_dir = ["fabricators", "spec/fabricators"]
end