module ThinkingSphinxRspecMatchers
  class Index
    def initialize(expected, args=nil)
      args ||= {}

      @expected = expected
      @from = Array(args[:from])
      @sortable = args[:sortable] || false
      @facet = args[:facet] || false
      @as = args[:as]
    end

    def matches?(target)
      @target = target

      if @target.sphinx_indexes?
        @target.class.define_indexes
        @target.sphinx_indexes.first.fields.select {|f|
          f.columns.first.__name == @expected &&
            f.columns.first.__stack == @from &&
            f.alias == @as &&
            f.sortable == @sortable &&
            (f.faceted.nil? ? true : f.faceted == @facet)
        }.count == 1
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@target} to define a field for #{@expected}"
    end

    def failure_message_for_should_not
      "expected #{@target} not to define a field for #{@expected}"
    end

    def description
      "have an index field for #{@as || @expected}"
    end
  end

  def index(expected, args=nil)
    Index.new(expected, args)
  end
end
