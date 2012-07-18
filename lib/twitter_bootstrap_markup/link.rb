module TwitterBootstrapMarkup
  class Link < Tag

    def initialize(*args, &block)
      text = args.shift unless block_given?
      url = args.shift
      attributes = args.shift || {}

      if block_given?
        super(:a, {:href => url}.merge(attributes), &block)
      else
        super(:a, text, {:href => url}.merge(attributes || {})) {}
      end
    end

  end
end