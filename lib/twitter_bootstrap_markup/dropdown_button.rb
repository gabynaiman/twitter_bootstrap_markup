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

    ButtonBase::TYPES.each do |type|
      define_method type do
        @button.send(type)
        self
      end
    end

    ButtonBase::SIZES.each do |size|
      define_method size do
        @button.send(size)
        self
      end
    end

    ButtonBase::TYPES.each do |type|
      define_singleton_method(type) do |*args, &block|
        self.new(*args, &block).send(type)
      end
    end

    ButtonBase::SIZES.each do |size|
      define_singleton_method(size) do |*args, &block|
        self.new(*args, &block).send(size)
      end
    end

    ButtonBase::TYPES.each do |type|
      ButtonBase::SIZES.each do |size|
        define_singleton_method("#{type}_#{size}") do |*args, &block|
          self.new(*args, &block).send(type).send(size)
        end
      end
    end

  end
end