module TwitterBootstrapMarkup
  class ProgressBar < Tag
    TYPES = [:info, :success, :danger, :warning]

    def initialize(percentage=0)
      super(:div, :class => 'progress') do
        append Tag.block(:div, :class => 'bar', :style => "width: #{percentage}%;")
      end
    end

    def striped
      attributes.append! :class, "progress-striped"
      self
    end

    def striped_animated
      attributes.append! :class, "progress-striped active"
      self
    end

    TYPES.each do |type|
      define_method type do
        attributes.append! :class, "progress-#{type}"
        self
      end
    end

    TYPES.each do |type|
      define_singleton_method type do |*args, &block|
        self.new(*args, &block).send(type)
      end

      define_singleton_method "#{type}_striped" do |*args, &block|
        self.new(*args, &block).send(type).striped
      end

      define_singleton_method "#{type}_striped_animated" do |*args, &block|
        self.new(*args, &block).send(type).striped_animated
      end
    end

  end
end