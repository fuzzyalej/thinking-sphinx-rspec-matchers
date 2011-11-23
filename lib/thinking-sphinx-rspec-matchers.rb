require 'rspec'
require_relative "thinking-sphinx-rspec-matchers/field_matcher.rb"
require_relative "thinking-sphinx-rspec-matchers/attribute_matcher.rb"
require_relative "thinking-sphinx-rspec-matchers/index_matcher.rb"

RSpec.configure do |c|
  c.include ThinkingSphinxRspecMatchers
end
