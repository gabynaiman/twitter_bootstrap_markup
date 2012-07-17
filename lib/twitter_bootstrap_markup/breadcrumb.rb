module TwitterBootstrapMarkup
  class Breadcrumb < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:ul, attributes.prepend!(:class, 'breadcrumb'), &block)
    end

    def append(element=nil, &block)
      internal_append Tag.block(:li) { append Divider.breadcrumb } unless children.empty?

      element = instance_eval(&block) if block_given?
      if element.is_a?(Tag) && element.name == :li
        internal_append element
      else
        internal_append Tag.block(:li) { append element }
      end
    end

  end
end