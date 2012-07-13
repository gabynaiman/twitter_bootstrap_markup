module TwitterBootstrapMarkup
  class LinkButton < ButtonBase

    def initialize(*args, &block)
      text = args.shift unless block_given?
      url = args.shift
      attributes = args.shift || {}

      if block_given?
        super(:a, attributes.prepend!(:class, 'btn').merge(:href => url), &block)
      else
        super(:a, attributes.prepend!(:class, 'btn').merge(:href => url)) { append text }
      end
    end

    ButtonBase::TYPES.each do |type|
      define_singleton_method(type) do |text, url, attributes={}|
        LinkButton.new(text, url, attributes.prepend!(:class, "btn-#{type}"))
      end
    end

  end
end