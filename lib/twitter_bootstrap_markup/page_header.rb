module TwitterBootstrapMarkup
  class PageHeader < Tag

    def initialize(title, subtitle=nil)
      super(:div, :class => 'page-header') do
        append do
          Tag.block(:h1) do
            append title
            append Tag.block(:small, "&nbsp;&nbsp;#{subtitle}") {} if subtitle
          end
        end

      end
    end

  end
end