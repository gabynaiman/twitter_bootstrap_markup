module TwitterBootstrapMarkup
  class NavListContainer < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:ul, attributes.prepend!(:class, 'nav nav-list')) do
        instance_eval &block
      end
    end

    def append(element=nil, &block)
      element = instance_eval(&block) if block_given?
      if element.is_a?(Tag) && element.name == :li
        internal_append element
      else
        internal_append Tag.block(:li) { append element }
      end
    end

  end

end