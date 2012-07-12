module TwitterBootstrapMarkup
  class Tag
    attr_reader :name
    attr_reader :attributes

    def initialize(name, attributes={}, &content)
      @name = name
      @attributes = attributes
      @content = content if block_given?
    end

    def html
      if @content
        "<#{name} #{attributes.to_markup}>#{@content.call}</#{name}>"
      else
        "<#{name} #{attributes.to_markup} />"
      end
    end

  end
end