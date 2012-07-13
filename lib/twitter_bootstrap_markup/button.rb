module TwitterBootstrapMarkup
  class Button < Tag

    def initialize(title, attributes={})
      super(:button, attributes.prepend!(:class, 'btn')) { append title }
    end

    def self.default(title, attributes={})
      Button.new(title, attributes)
    end

    def self.primary(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-primary'))
    end

    def self.info(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-info'))
    end

    def self.success(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-success'))
    end

    def self.warning(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-warning'))
    end

    def self.danger(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-danger'))
    end

    def self.inverse(title, attributes={})
      Button.new(title, attributes.prepend!(:class, 'btn-inverse'))
    end

  end
end