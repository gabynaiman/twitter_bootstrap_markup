module TwitterBootstrapMarkup
  class TabContent < Tag
    alias :internal_append :append

    def initialize(attributes={}, &block)
      if block_given?
        super(:div, attributes.prepend!(:class, 'tab-content'), &block)
      else
        super(:div, attributes.prepend!(:class, 'tab-content')) {}
      end
    end

    def append(*args, &block)
      id = args.shift
      element = block_given? ? instance_eval(&block) : args.shift
      mode = args.shift || :inactive

      if element.is_a?(Tag) && element.name == :div && element.attributes[:class].include?('tab-pane')
        element.attributes[:id] = id
        element.attributes.append!(:class, 'active') if mode == :active
        internal_append element
      else
        attributes = {:class => 'tab-pane', :id => id}
        attributes.append!(:class, :active) if mode == :active
        internal_append Tag.block(:div, element, attributes)
      end
    end
  end
end