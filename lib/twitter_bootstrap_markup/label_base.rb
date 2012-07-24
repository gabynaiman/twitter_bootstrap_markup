module TwitterBootstrapMarkup
  module LabelBase
    TYPES = [:success, :warning, :important, :info, :inverse]

    def initialize(text)
      super(:span, text, :class => class_name.downcase) {}
    end

    def self.included(base)

      TYPES.each do |type|
        base.send(:define_method, type) do
          attributes.append!(:class, "#{class_name.downcase}-#{type}")
          self
        end
      end

      TYPES.each do |type|
        base.send(:define_singleton_method, type) do |*args, &block|
          self.new(*args, &block).send(type)
        end
      end

    end

    private

    def class_name
      self.class.name.split('::').last
    end

  end
end