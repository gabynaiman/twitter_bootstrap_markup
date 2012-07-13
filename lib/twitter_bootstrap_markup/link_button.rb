module TwitterBootstrapMarkup
  class LinkButton < ButtonBase

    def initialize(title, url, attributes={})
      super(:a, attributes.prepend!(:class, 'btn').merge(:href => url)) { append title }
    end

    ButtonBase::TYPES.each do |type|
      define_singleton_method(type) do |title, url, attributes={}|
        LinkButton.new(title, url, attributes.prepend!(:class, "btn-#{type}"))
      end
    end

  end
end