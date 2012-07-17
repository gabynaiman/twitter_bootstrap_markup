module TwitterBootstrapMarkup
  class GridRow < Tag

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'row'), &block)
    end

  end
end