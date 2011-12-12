require 'spec_helper'

describe "define_an_index" do
  let(:matcher) { ThinkingSphinxRspecMatchers::DefineAnIndex.new }
  
  it_should_behave_like "a rspec matcher"

  it "should be true if an index is defined" do
    target = "asdf"
    target.should_receive(:sphinx_indexes?).and_return(true)
    (matcher.matches?(target)).should be_true
  end

  it "should be false if an index is not defined" do
    target = "other target"
    target.should_receive(:sphinx_indexes?).and_return(false)
    (matcher.matches?(target)).should be_false
  end
end
