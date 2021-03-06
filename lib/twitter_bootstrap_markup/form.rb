module TwitterBootstrapMarkup
  class Form < Tag
    TYPES = [:vertical, :inline, :search, :horizontal]

    def initialize(attributes={}, &block)
      if block_given?
        super(:form, attributes, &block)
      else
        super(:form, attributes) {}
      end
    end

    TYPES.each do |type|
      define_method(type) do
        attributes.append!(:class, "form-#{type}") unless type == :vertical
        self
      end
    end

    TYPES.each do |type|
      define_singleton_method(type) do |*args, &block|
        self.new(*args, &block).send(type)
      end
    end

  end
end