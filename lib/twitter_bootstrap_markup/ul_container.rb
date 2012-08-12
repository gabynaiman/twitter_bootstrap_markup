module TwitterBootstrapMarkup
  class UlContainer < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:ul, attributes, &(block  || Proc.new{}))
    end

    def append(element=nil, mode=:inactive, &block)
      element = instance_eval(&block) if block_given?
      if element.is_a?(Tag) && element.name == :li
        element.attributes.append!(:class, 'active') if mode == :active
        internal_append element
      else
        attributes = mode == :active ? {:class => 'active'} : {}
        internal_append Tag.block(:li, element, attributes)
      end
    end

  end
end