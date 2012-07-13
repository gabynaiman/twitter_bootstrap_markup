module TwitterBootstrapMarkup
  class ButtonBase < Tag
    TYPES = [:primary, :info, :success, :warning, :danger, :inverse]
    SIZES = [:large, :small, :mini]

    TYPES.each do |type|
      define_method type do
        attributes.append!(:class, "btn-#{type}")
        self
      end
    end

    SIZES.each do |size|
      define_method size do
        self.attributes.append!(:class, "btn-#{size}")
        self
      end
    end

    TYPES.each do |type|
      define_singleton_method(type) do |*args, &block|
        self.new(*args, &block).send(type)
      end
    end

    SIZES.each do |size|
      define_singleton_method(size) do |*args, &block|
        self.new(*args, &block).send(size)
      end
    end

    TYPES.each do |type|
      SIZES.each do |size|
        define_singleton_method("#{type}_#{size}") do |*args, &block|
          self.new(*args, &block).send(type).send(size)
        end
      end
    end

  end
end