module TwitterBootstrapMarkup
  class Alert < Tag
    TYPES = [:warning, :info, :success, :danger]

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'alert'), &block)
    end

    TYPES.each do |type|
      define_method type do
        attributes.append!(:class, "alert-#{type}") unless type == :warning
        self
      end
    end

    def closable
      prepend Tag.new(:button, :class => 'close', 'data-dismiss' => 'alert') { append '&times' }
      self
    end

    TYPES.each do |type|
      define_singleton_method type do |*args, &block|
        self.new(*args, &block).send(type)
      end

      define_singleton_method "#{type}_closable" do |*args, &block|
        self.new(*args, &block).send(type).closable
      end
    end

    def self.closable(*args, &block)
      self.new(*args, &block).closable
    end
  end
end