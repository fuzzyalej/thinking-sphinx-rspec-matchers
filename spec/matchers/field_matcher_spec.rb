require 'spec_helper'

describe ThinkingSphinxRspecMatchers::Index do
  include MockObjects

  #matcher here is only for the behaviour, should refactor this
  let(:matcher) { ThinkingSphinxRspecMatchers::Index.new(:trivial)}
  it_should_behave_like "a rspec matcher"

  describe "Field matcher (index)" do
    it "should work with a field" do
      # it { should index :author }
      target = Target.new name: :author
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author)
      matcher.matches?(target).should be_true
    end

    it "should work with a field from a relationship" do
      # it { should index :author, :from => :user }
      target = Target.new name: :author, stack: :user
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, from: :user)
      matcher.matches?(target).should be_true
    end

    it "should work with a sorted field" do
      # it { should index :author, :sortable => true }
      target = Target.new name: :author, sortable: true
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, sortable: true)
      matcher.matches?(target).should be_true
    end

    it "should work with a faceted field" do
      # it { should index :author, :faceted => true }
      target = Target.new name: :author, faceted: true
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, facet: true)
      matcher.matches?(target).should be_true
    end

    it "should work with a renamed field" do
      # it { should index :author, :as => :dawg }
      target = Target.new name: :author, alias: :dawg
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, as: :dawg)
      matcher.matches?(target).should be_true
    end

    it "should work with a sorted, faceted, renamed field from a relationship" do
      # it { should index :author, :from => :user, :as => :dawg,
      #   :sortable => true, :faceted => true }
      target = Target.new name: :author, stack: :user, alias: :dawg, sortable: true, faceted: true
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, from: :user, as: :dawg, sortable: true, facet: true)
      matcher.matches?(target).should be_true
    end

    it "should not find a nonexistant field" do
      # it { should index :car_model }
      target = Target.new name: :author
      matcher = ThinkingSphinxRspecMatchers::Index.new(:car_model)
      matcher.matches?(target).should be_false
    end

    it "should not find a nonexistant relationship" do
      # it { should index :author, :from => :user }
      target = Target.new name: :author, stack: :other_user
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, from: :user)
      matcher.matches?(target).should be_false
    end

    it "should not find a non-sorted field" do
      # it { should index :author, :sortable => true }
      target = Target.new name: :author, sortable: false
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, sortable: true)
      matcher.matches?(target).should be_false
    end

    it "should not find a non-faceted field" do
      # it { should index :author, :faceted => true }
      target = Target.new name: :author, faceted: false
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, facet: true)
      matcher.matches?(target).should be_false
    end

    it "should not find a non-renamed field" do
      # it { should index :author, :as => :dawg }
      target = Target.new name: :author, alias: :catz
      matcher = ThinkingSphinxRspecMatchers::Index.new(:author, as: :dawg)
      matcher.matches?(target).should be_false
    end
  end
end
# Do negatives without specifying the field
# should i rename the fields to be called the same (mockobject and spec) and (spec and thinkingsphinx)
