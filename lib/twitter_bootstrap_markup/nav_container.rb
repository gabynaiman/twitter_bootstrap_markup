module TwitterBootstrapMarkup
  class NavContainer < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:ul, attributes.prepend!(:class, 'nav')) do
        instance_eval &block
      end
    end

    def append(element=nil, mode=:inactive, &block)
      element = instance_eval(&block) if block_given?
      if element.is_a?(Tag) && element.name == :li
        element.attributes.append!(:class, 'active') if mode == :active
        internal_append element
      else
        attributes = mode == :active ? {:class => 'active'} : {}
        internal_append Tag.block(:li, attributes) { append element }
      end
    end

  end

end