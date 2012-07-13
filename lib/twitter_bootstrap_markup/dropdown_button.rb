module TwitterBootstrapMarkup
  class DropdownButton < Tag
    alias :internal_append :append

    def initialize(text, &block)
      super(:div, :class => 'btn-group') do
        @button = internal_append(Button.new(:class => 'dropdown-toggle', 'data-toggle' => 'dropdown') do
          append "#{text} "
          append Tag.block :span, :class => 'caret'
        end)
        @ul = internal_append Tag.block(:ul, :class => 'dropdown-menu')
        instance_eval &block
      end
    end

    def append(element)
      @ul.append Tag.block(:li) { append element }
    end

  end
end