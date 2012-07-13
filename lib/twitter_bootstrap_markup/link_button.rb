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

  end
end