module TwitterBootstrapMarkup
  class Help < Tag

    def initialize(type, text)
      case type
        when :inline
          super(:span, text, :class => 'help-inline') {}
        when :block
          super(:p, text, :class => 'help-block') {}
        else
          raise "Invalid help type [#{type}]"
      end
    end

    def self.inline(text)
      self.new(:inline, text)
    end

    def self.block(text)
      self.new(:block, text)
    end

  end
end