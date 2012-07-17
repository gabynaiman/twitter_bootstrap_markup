module TwitterBootstrapMarkup
  class Tag
    include Tooltip

    attr_reader :name
    attr_reader :attributes
    attr_reader :children

    def self.inline(name, attributes={})
      Tag.new(name, attributes)
    end

    def self.block(name, attributes={}, &block)
      if block_given?
        Tag.new(name, attributes, &block)
      else
        Tag.new(name, attributes) {}
      end
    end

    def initialize(name, attributes={}, &block)
      @name = name
      @attributes = attributes
      @children = []
      @is_block = block_given?
      instance_eval &block if block_given?
    end

    def append(element=nil, &block)
      element = instance_eval(&block) if block_given?
      @children << element
      element
    end

    def prepend(element)
      @children.insert 0, element
    end

    def pull_right
      attributes.append!(:class, 'pull-right')
      self
    end

    def pull_left
      attributes.append!(:class, 'pull-left')
      self
    end

    def to_s
      attributes_markup = attributes.empty? ? '' : " #{attributes.map{|key, value| "#{key}#{value ? "=\"#{value}\"" : ''}"}.join(' ')}"
      if @is_block
        "<#{name}#{attributes_markup}>#{children.map(&:to_s).join}</#{name}>"
      else
        "<#{name}#{attributes_markup}>"
      end
    end

  end
end