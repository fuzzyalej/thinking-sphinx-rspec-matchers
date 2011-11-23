module ThinkingSphinxRspecMatchers
  class HaveAttribute
    def initialize(expected, args)
      args ||= {}

      @expected = expected
      @facet = args[:facet] || false
      @as = args[:as]
      @from = args[:from]
      @sortable = args[:sortable]
    end

    def matches?(target)
      @target = target

      if @target.sphinx_indexes?
        @target.class.define_indexes
        @target.sphinx_indexes.first.attributes.select {|a|
          a.columns.first.__name == @expected &&
            a.alias == @as &&
            (a.faceted.nil? ? true : a.faceted == @facet)
        }.count == 1
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@target} to have an attribute for #{@expected}"
    end

    def failure_message_for_should_not
      "expected #{@target} not to define an attribute for #{@expected}"
    end

    def description
      "have a search attribute for #{@as || @expected}"
    end
  end

  def have_attribute(expected, args=nil)
    HaveAttribute.new(expected, args)
  end
end
