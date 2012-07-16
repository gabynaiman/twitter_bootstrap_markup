module TwitterBootstrapMarkup
  class Brand < Tag

    def initialize(title, url)
      super(:a, :class => 'brand', :href => url) { append title }
    end

  end
end