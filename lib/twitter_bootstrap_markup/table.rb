module TwitterBootstrapMarkup
  class Table < Tag
    TYPES = [:bordered, :striped, :condensed]

    def initialize(attributes={}, &block)
      attributes.prepend!(:class, 'table')
      if block_given?
        super(:table, attributes, &block)
      else
        super(:table, attributes) {}
      end
    end

    TYPES.each do |type|
      define_method type do |&block|
        attributes.append!(:class, "table-#{type}")
        instance_eval &block if block
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