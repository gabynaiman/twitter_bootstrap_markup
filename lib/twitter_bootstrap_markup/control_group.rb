module TwitterBootstrapMarkup
  class ControlGroup < Tag
    TYPES = [:warning, :error, :success]

    def initialize(label, attributes={}, &block)
      super(:div, :class => 'control-group') do
        append Tag.block(:label, label, attributes.prepend!(:class, 'control-label'))
        append Tag.block(:div, :class => 'controls', &block)
      end
    end

    TYPES.each do |type|
      define_method type do
        self.attributes.append!(:class, type)
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