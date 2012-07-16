module TwitterBootstrapMarkup
  class LabelBase < Tag
    TYPES = [:success, :warning, :important, :info, :inverse]

    def initialize(text)
      super(:span, :class => class_name.downcase) { append text }
    end

    TYPES.each do |type|
      define_method type do
        attributes.append!(:class, "#{class_name.downcase}-#{type}")
        self
      end
    end

    TYPES.each do |type|
      define_singleton_method type do |*args, &block|
        self.new(*args, &block).send(type)
      end
    end

    private

    def class_name
      self.class.name.split('::').last
    end

  end
end