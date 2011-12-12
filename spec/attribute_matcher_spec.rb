require 'spec_helper'

describe "have_attribute" do
  let(:matcher) { ThinkingSphinxRspecMatchers::HaveAttribute.new(:blah, nil) }

  it_should_behave_like "a rspec matcher"
end
