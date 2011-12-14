require 'spec_helper'

describe ThinkingSphinxRspecMatchers::DefineAnIndex do
  include MockObjects

  #refactor this
  let(:matcher) { ThinkingSphinxRspecMatchers::DefineAnIndex.new }
  it_should_behave_like "a rspec matcher"

  describe "Index matcher (define_an_index)" do
    it "should be true if an index is defined" do
      target = Target.new indexed: true
      matcher.matches?(target).should be_true
    end

    it "should be false if an index is not defined" do
      target = Target.new indexed: false
      matcher.matches?(target).should be_false
    end
  end
end
