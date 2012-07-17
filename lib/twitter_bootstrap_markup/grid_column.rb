module TwitterBootstrapMarkup
  class GridColumn < Tag

    def initialize(*args, &block)
      size = args.shift
      offset = args.shift if args.first.is_a?(Fixnum)
      attributes = args.shift || {}
      attributes.prepend!(:class, "span#{size}")
      attributes.append!(:class, "offset#{offset}") if offset
      super(:div, attributes, &block)
    end

  end
end