share_examples_for "a rspec matcher" do
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
