module TwitterBootstrapMarkup
  class Tag
    include Tooltip
    include Popover
    include SidePosition

    attr_reader :name
    attr_reader :attributes
    attr_reader :children

    def self.inline(name, attributes={})
      Tag.new(name, attributes)
    end

    def self.block(*args, &block)
      if block_given?
        Tag.new(*args, &block)
      else
        Tag.new(*args) {}
      end
    end

    def initialize(*args, &block)
      @name = args.shift
      content = args.shift unless args.first.is_a?(Hash)
      @attributes = args.shift || {}
      @children = []
      @is_block = content || block_given?
      append content if content
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