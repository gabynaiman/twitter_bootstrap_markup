module TwitterBootstrapMarkup
  class NavListContainer < NavContainer

    def initialize(attributes={}, &block)
      super(attributes.append!(:class, 'nav-list'), &block)
    end

  end

end