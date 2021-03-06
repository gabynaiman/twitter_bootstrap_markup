module TwitterBootstrapMarkup
  class Divider < Tag

    def initialize(type)
      case type
        when :horizontal
          super(:li, :class => 'divider') {}
        when :vertical
          super(:li, :class => 'divider-vertical') {}
        when :breadcrumb
          super(:span, '/', :class => 'divider') {}
        else
          raise "Invalid divider type [#{type}]"
      end
    end

    def self.horizontal
      self.new :horizontal
    end

    def self.vertical
      self.new :vertical
    end

    def self.breadcrumb
      self.new :breadcrumb
    end

  end
end