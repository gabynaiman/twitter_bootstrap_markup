module TwitterBootstrapMarkup
  module TagBuilder

    def self.class_of(constant)
      "TwitterBootstrapMarkup::#{constant}".safe_constantize
    end

    TwitterBootstrapMarkup.constants.select { |c| class_of(c).is_a?(Class) }.each do |constant|
      tag_class = class_of(constant)
      define_singleton_method constant.to_s.underscore do |*args, &block|
        tag_class.new(*args, &block)
      end

      tag_class.methods(false).each do |method|
        define_singleton_method "#{constant.to_s.underscore}_#{method}" do |*args, &block|
          tag_class.send(method, *args, &block)
        end
      end
    end

  end
end