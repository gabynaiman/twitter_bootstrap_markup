module TwitterBootstrapMarkup
  class Tab < Tag
    attr_reader :nav
    attr_reader :content

    def initialize(attributes={}, &block)
      super(:div, attributes.prepend!(:class, 'tab')) {}
      @nav = append NavTabContainer.new
      @content = append TabContent.new
      instance_eval &block if block_given?
    end

  end
end