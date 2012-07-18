module TwitterBootstrapMarkup
  class AddOn < Tag

    def initialize(text)
      super(:span, text, :class => 'add-on')
    end

  end
end