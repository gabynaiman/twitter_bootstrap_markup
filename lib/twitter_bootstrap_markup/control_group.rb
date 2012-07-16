module TwitterBootstrapMarkup
  class ControlGroup < Tag

    def initialize(label, attributes={}, &block)
      super(:div, :class => 'control-group') do
        append Tag.block(:label, attributes.prepend!(:class, 'control-label')) { append label }
        append Tag.block(:div, :class => 'controls', &block)
      end
    end

  end
end