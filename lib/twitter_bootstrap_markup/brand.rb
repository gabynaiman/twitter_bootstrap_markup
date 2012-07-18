module TwitterBootstrapMarkup
  class Brand < Tag

    def initialize(title, url)
      super(:a, title, :class => 'brand', :href => url)
    end

  end
end