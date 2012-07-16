module TwitterBootstrapMarkup
  class NavHeader < Tag

    def initialize(text)
      super(:li, :class => 'nav-header') { append text }
    end

  end
end