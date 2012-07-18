module TwitterBootstrapMarkup
  class Breadcrumb < Tag
    alias :internal_append :append

    def initialize(*args, &block)
      super(:ul, *args, &block)
      attributes.prepend!(:class, 'breadcrumb')
    end

    def append(element=nil, &block)
      internal_append Tag.block(:li, Divider.breadcrumb) unless children.empty?

      element = instance_eval(&block) if block_given?
      if element.is_a?(Tag) && element.name == :li
        internal_append element
      else
        internal_append Tag.block(:li, element)
      end
    end

  end
end