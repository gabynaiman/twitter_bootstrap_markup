module TwitterBootstrapMarkup
  class NavBar < Tag

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'navbar')){}
      append do
        Tag.new(:div, :class => 'navbar-inner') do
          append Tag.new(:div, :class => 'container', &block)
        end
      end
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