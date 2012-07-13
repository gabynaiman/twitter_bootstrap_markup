module TwitterBootstrapMarkup
  class Input < Tag
    TYPES = [:text, :hidden, :email, :password, :button, :checkbox, :radio]

    def initialize(type, attributes={}, &block)
      super(:input, {:type => type}.merge(attributes), &block)
    end

    TYPES.each do |type|
      define_singleton_method(type) do |*args, &block|
        self.new(type, *args, &block)
      end
    end

  end
end