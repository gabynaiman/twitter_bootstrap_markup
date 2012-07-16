module TwitterBootstrapMarkup
  class NavList < Well

    def initialize(attributes={}, &block)
      super(attributes.append!(:style, 'padding: 8px 0;')) do
        append NavListContainer.new(&block)
      end
    end
  end

end