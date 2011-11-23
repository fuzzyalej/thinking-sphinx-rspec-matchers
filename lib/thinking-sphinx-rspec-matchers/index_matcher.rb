module ThinkingSphinxRspecMatchers
  class DefineAnIndex
    def matches?(target)
      @target = target

      if @target.respond_to?(:sphinx_indexes?) && @target.sphinx_indexes?
        true
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@target} to define an index"
    end

    def failure_message_for_should_not
      "expected #{@target} not to define an index"
    end

    def description
      "have an index"
    end
  end

  def define_an_index
    DefineAnIndex.new
  end
end
