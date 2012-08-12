module TwitterBootstrapMarkup
  class DropdownLink < Tag
    alias :internal_append :append

    def initialize(text, &block)
      super(:div, :class => 'dropdown') do
        internal_append(Link.new('#', :class => 'dropdown-toggle', 'data-toggle' => 'dropdown') do
          append "#{text} "
          append Tag.block :span, :class => 'caret'
        end)
        @ul = internal_append Tag.block(:ul, :class => 'dropdown-menu')
        instance_eval &block if block_given?
      end
    end

    def append(element)
      if element.is_a?(Tag) && element.name == :li
        @ul.append element
      else
        @ul.append Tag.block(:li, element)
      end
    end

    def as_nav_item
      @name = :li
      self
    end

  end
end