require 'spec_helper'

describe ThinkingSphinxRspecMatchers::HaveAttribute do
  include MockObjects

  #should refactor this
  let(:matcher) { ThinkingSphinxRspecMatchers::HaveAttribute.new(:blah, nil) }
  it_should_behave_like "a rspec matcher"

  describe "Attribute matcher (have_attribute)" do
    it "should work with a field" do
      # it { should have_attribute :author }
      target = Target.new name: :author
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author)
      matcher.matches?(target).should be_true
    end

    it "should work with a faceted field" do
      # it { should have_attribute :author, :facet => true }
      target = Target.new name: :author, faceted: true
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author, facet: true)
      matcher.matches?(target).should be_true
    end

    it "should work with a renamed field" do
      # it { should have_attribute :author, :as => :name }
      target = Target.new name: :author, alias: :name
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author, as: :name)
      matcher.matches?(target).should be_true
    end

    it "should work with a faceted, renamed field" do
      # it { should have_attribute :author, :facet => true, :as => :name }
      target = Target.new name: :author, faceted: true, alias: :name
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author, facet: true, as: :name)
      matcher.matches?(target).should be_true
    end

    it "should not find a nonexistant field" do
      # it { should have_attribute :author }
      target = Target.new name: :cockatrice
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author)
      matcher.matches?(target).should be_false
    end

    it "should not find a non-faceted field" do
      # it { should have_attribute :author, :facet => true }
      target = Target.new name: :author, faceted: false
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author, facet: true)
      matcher.matches?(target).should be_false
    end

    it "should not find a non-renamed field" do
      # it { should have_attribute :author, :as => :name }
      target = Target.new name: :author, alias: :bongos
      matcher = ThinkingSphinxRspecMatchers::HaveAttribute.new(:author, as: :name)
      matcher.matches?(target).should be_false
    end
  end
end
