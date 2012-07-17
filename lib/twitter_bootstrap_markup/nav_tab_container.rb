module TwitterBootstrapMarkup
  class NavTabContainer < NavContainer

    def initialize(attributes={}, &block)
      if block_given?
        super(attributes.append!(:class, 'nav-tabs'), &block)
      else
        super(attributes.append!(:class, 'nav-tabs')) {}
      end
    end

  end
end