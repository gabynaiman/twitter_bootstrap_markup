module TwitterBootstrapMarkup
  class Button < ButtonBase

    def initialize(*args, &block)
      text = args.shift unless block_given?
      attributes = args.shift || {}

      if block_given?
        super(:button, attributes.prepend!(:class, 'btn'), &block)
      else
        super(:button, attributes.prepend!(:class, 'btn')) { append text }
      end
    end

    ButtonBase::TYPES.each do |type|
      define_singleton_method(type) do |*args, &block|
        Button.new(*args, &block).send(type)
      end
    end

    ButtonBase::SIZES.each do |size|
      define_singleton_method(size) do |*args, &block|
        Button.new(*args, &block).send(size)
      end
    end

    ButtonBase::TYPES.each do |type|
      ButtonBase::SIZES.each do |size|
        define_singleton_method("#{type}_#{size}") do |*args, &block|
          Button.new(*args, &block).send(type).send(size)
        end
      end
    end

  end
end