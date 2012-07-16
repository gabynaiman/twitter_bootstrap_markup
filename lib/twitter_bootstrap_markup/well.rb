module TwitterBootstrapMarkup
  class Well < Tag

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'well'), &block)
    end

    def small
      attributes.append!(:class, 'well-small')
      self
    end

    def large
      attributes.append!(:class, 'well-large')
      self
    end

    def self.small(*args, &block)
      self.new(*args, &block).small
    end

    def self.large(*args, &block)
      self.new(*args, &block).large
    end

  end
end