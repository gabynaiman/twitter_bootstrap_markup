module TwitterBootstrapMarkup
  class NavBar < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'navbar')) {}
      @container = Tag.block(:div, :class => 'container', &block)
      internal_append Tag.block(:div, @container, :class => 'navbar-inner')
    end

    def append(*args, &block)
      @container.append(*args, &block)
    end

    def top
      attributes.append!(:class, 'navbar-fixed-top')
      self
    end

    def bottom
      attributes.append!(:class, 'navbar-fixed-bottom')
      self
    end

    def self.top(*args, &block)
      self.new(*args, &block).top
    end

    def self.bottom(*args, &block)
      self.new(*args, &block).bottom
    end

  end
end