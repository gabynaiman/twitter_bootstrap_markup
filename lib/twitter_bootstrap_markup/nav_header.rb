module TwitterBootstrapMarkup
  class NavHeader < Tag

    def initialize(text)
      super(:li, text, :class => 'nav-header') {}
    end

  end
end