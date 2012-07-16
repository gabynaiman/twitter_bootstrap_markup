module TwitterBootstrapMarkup
  class Label < Tag
    TYPES = [:success, :warning, :important, :info, :inverse]

    def initialize(text)
      super(:span, :class => 'label') { append text }
    end

    TYPES.each do |type|
      define_method type do
        attributes.append!(:class, "label-#{type}")
        self
      end
    end

    TYPES.each do |type|
      define_singleton_method type do |*args, &block|
        self.new(*args, &block).send(type)
      end
    end

  end
end