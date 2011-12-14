ENV['RAILS_ENV'] = "test"

require 'rspec'
require_relative 'shared_examples'
require_relative 'mock_objects'
require_relative '../lib/thinking-sphinx-rspec-matchers'
