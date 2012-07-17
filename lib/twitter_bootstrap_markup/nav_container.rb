module TwitterBootstrapMarkup
  class NavContainer < UlContainer

    def initialize(attributes={}, &block)
      super(attributes.prepend!(:class, 'nav'), &block)
    end

  end

end