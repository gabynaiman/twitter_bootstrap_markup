module TwitterBootstrapMarkup
  class NavList < Well
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(attributes.append!(:style, 'padding: 8px 0;')) {}
      @container = NavListContainer.new(&block)
      internal_append @container
    end

    def append(*args, &block)
      @container.append(*args, &block)
    end

  end
end