module TwitterBootstrapMarkup
  class LinkButton < Tag
    include ButtonBase

    def initialize(*args, &block)
      text = args.shift unless block_given?
      url = args.shift
      attributes = args.shift || {}

      if block_given?
        super(:a, attributes.prepend!(:class, 'btn').merge(:href => url), &block)
      else
        super(:a, text, attributes.prepend!(:class, 'btn').merge(:href => url)) {}
      end
    end

  end
end