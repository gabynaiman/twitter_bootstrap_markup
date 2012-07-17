module TwitterBootstrapMarkup
  class Pagination < Tag

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'pagination')) do
        append UlContainer.new(&block)
      end
    end

    def centered
      attributes.append!(:class, 'pagination-centered')
      self
    end

    def right
      attributes.append!(:class, 'pagination-right')
      self
    end

    def self.centered(*args, &block)
      self.new(*args, &block).centered
    end

    def self.right(*args, &block)
      self.new(*args, &block).right
    end

  end
end