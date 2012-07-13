module TwitterBootstrapMarkup
  class Icon < Tag

    def initialize(name)
      super(:i, :class => "icon-#{name}") {}
    end

    def white
      attributes.append!(:class, 'icon-white')
      self
    end

  end
end