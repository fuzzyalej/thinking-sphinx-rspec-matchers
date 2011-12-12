require 'spec_helper'

describe "index" do
  let(:matcher) { ThinkingSphinxRspecMatchers::Index.new(:blah, nil) }

  it_should_behave_like "a rspec matcher"
end
