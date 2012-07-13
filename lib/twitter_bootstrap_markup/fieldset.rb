module TwitterBootstrapMarkup
  class Fieldset < Tag

    def initialize(*args, &block)
      legend = args[0].is_a?(String) ? args.shift : nil
      attributes = args.shift || {}

      if block_given?
        super(:fieldset, attributes, &block)
      else
        super(:fieldset, attributes) {}
      end

      prepend Tag.new(:legend) { append legend } if legend
    end

  end
end