module MockObjects
  class ParentTarget
    def self.define_indexes; true; end
  end

  class Target < ParentTarget
    def initialize(args={})
      @indexed = args.delete :indexed
      @args = args
    end

    def sphinx_indexes
      [IndexFactory.new(@args)]
    end

    def sphinx_indexes?
      (@indexed.nil? || @indexed) ? true : false
    end
  end

  class IndexFactory
    def initialize(args)
      @args = args
    end

    def fields
      [Field.new(@args)]
    end

    # This is a quick hack, implement it ok and make proper tests for more complex scenarios
    # this should make you reconsider thinking the parameters to Target.new, separating them
    # into field args and attribute args... hacky and cleaner or complete but messier?
    def attributes
      #[Attribute.new(@args)]
      [Field.new(@args)]
    end
  end

  class Field
    def initialize(args)
      args ||= {}

      @name = args[:name]
      @stack = Array(args[:stack])
      @sortable = args[:sortable] || false
      @faceted = args[:faceted] || false
      @alias = args[:alias]
    end

    def columns
      [Column.new(@name, @stack)]
    end

    def alias
      @alias
    end

    def sortable
      @sortable
    end

    def faceted
      @faceted
    end
  end

  class Column
    def initialize(name, stack)
      @name = name
      @stack = stack
    end

    def __name
      @name
    end

    def __stack
      #shouldn't this be [@stack] ??
      @stack
    end
  end
end
