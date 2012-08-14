module TwitterBootstrapMarkup
  class UlContainer < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      super(:ul, attributes, &(block || Proc.new {}))
    end

    def append(element=nil, mode=:inactive, &block)
      element = instance_eval(&block) if block_given?
      if is_li? element
        element.attributes.append!(:class, 'active') if mode == :active
        internal_append element
      else
        attributes = mode == :active ? {:class => 'active'} : {}
        internal_append Tag.block(:li, element, attributes)
      end
    end

    private

    def is_li?(element)
      (element.is_a?(Tag) && element.name == :li) ||
          (element.is_a?(String) && ['<li>', '<li '].include?(element.downcase[0..3]))
    end

  end
end