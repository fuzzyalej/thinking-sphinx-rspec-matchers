require 'spec_helper'

describe "define_an_index" do
  let(:matcher) { ThinkingSphinxRspecMatchers::DefineAnIndex.new }

  describe "rspec matcher" do
    it "should have a matching method" do
      matcher.should respond_to :matches?
    end

    it "should have a failure message" do
      matcher.should respond_to :failure_message_for_should
    end

    it "should have a negative failure message" do
      matcher.should respond_to :failure_message_for_should_not
    end

    it "should have a description" do
      matcher.should respond_to :description
    end
  end

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
