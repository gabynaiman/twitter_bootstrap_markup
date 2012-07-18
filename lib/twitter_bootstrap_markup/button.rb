module TwitterBootstrapMarkup
  class Button < ButtonBase

    def initialize(*args, &block)
      text = args.shift unless block_given?
      attributes = args.shift || {}

      if block_given?
        super(:button, attributes.prepend!(:class, 'btn'), &block)
      else
        super(:button, text, attributes.prepend!(:class, 'btn'))
      end
    end

  end
end