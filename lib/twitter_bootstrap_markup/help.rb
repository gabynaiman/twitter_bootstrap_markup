module TwitterBootstrapMarkup
  class Help < Tag

    def initialize(type, text)
      case type
        when :inline
          super(:span, :class => 'help-inline') { append text }
        when :block
          super(:p, :class => 'help-block') { append text }
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