module TwitterBootstrapMarkup
  class Button < ButtonBase

    def initialize(title, attributes={})
      super(:button, attributes.prepend!(:class, 'btn')) { append title }
    end

    ButtonBase::TYPES.each do |type|
      define_singleton_method(type) do |title, attributes={}|
        Button.new(title, attributes.prepend!(:class, "btn-#{type}"))
      end
    end

  end
end