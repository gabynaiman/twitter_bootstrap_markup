module TwitterBootstrapMarkup
  class AddOn < Tag

    def initialize(text)
      super(:span, :class => 'add-on') { append text }
    end

  end
end