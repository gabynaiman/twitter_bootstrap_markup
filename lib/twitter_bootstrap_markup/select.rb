module TwitterBootstrapMarkup
  class Select < Tag
    SIZES = [:mini, :small, :medium, :large, :xlarge, :xxlarge]

    def initialize(*args, &block)
      @options = args.shift || [] unless block_given?
      attributes = args.shift || {}
      @selected_value = attributes.delete(:selected_value)
      prompt = attributes.delete(:prompt)

      if block_given?
        super(:select, attributes, &block)
      else
        super(:select, attributes) {}
        append_options
      end

      prepend Tag.new(:option, prompt, :value => '') {} if prompt
    end

    SIZES.each do |size|
      define_method(size) do
        attributes.append!(:class, "input-#{size}")
        self
      end
    end

    SIZES.each do |size|
      define_singleton_method(size) do |*args, &block|
        self.new(*args, &block).send(size)
      end
    end

    private

    def append_options
      if @options.is_a? Hash
        append_options_hash @options
      else
        append_options_array @options
      end
    end

    def append_options_array(options, container=self)
      options.each do |option|
        o = container.append Tag.block(:option, option, :value => option) {}
        o.attributes[:selected] = nil if option.to_s == @selected_value.to_s
      end
    end

    def append_options_hash(options, container=self)
      options.each do |key, value|
        if value.is_a? Array
          group = append Tag.block(:optgroup, :label => key)
          append_options_array(value, group)
        elsif value.is_a? Hash
          group = append Tag.block(:optgroup, :label => key)
          append_options_hash(value, group)
        else
          o = container.append Tag.block(:option, key, :value => value) {}
          o.attributes[:selected] = nil if value.to_s == @selected_value.to_s
        end
      end
    end

  end
end