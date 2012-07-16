module TwitterBootstrapMarkup
  class ExtendedInput < Tag

    def initialize(attributes={}, &block)
      super(:div, attributes, &block)
      attributes.append!(:class, 'input-prepend') unless children.first.is_a?(Input) && children.first.attributes[:type] == :text
      attributes.append!(:class, 'input-append') unless children.last.is_a?(Input) && children.last.attributes[:type] == :text
    end

  end
end