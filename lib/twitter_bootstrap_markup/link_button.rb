module TwitterBootstrapMarkup
  class LinkButton < Tag

    def initialize(title, url, attributes={})
      super(:a, attributes.prepend!(:class, 'btn').merge(:href => url)) { append title }
    end

    def self.default(title, url, attributes={})
      LinkButton.new(title, url, attributes)
    end

    def self.primary(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-primary'))
    end

    def self.info(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-info'))
    end

    def self.success(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-success'))
    end

    def self.warning(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-warning'))
    end

    def self.danger(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-danger'))
    end

    def self.inverse(title, url, attributes={})
      LinkButton.new(title, url, attributes.prepend!(:class, 'btn-inverse'))
    end

  end
end