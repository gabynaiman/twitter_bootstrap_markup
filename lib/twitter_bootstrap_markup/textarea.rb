module TwitterBootstrapMarkup
  class Textarea < Tag
    extend InputSize::ClassMethods
    include InputSize::InstanceMethods

    def initialize(*args, &block)
      if block_given?
        super(:textarea, *args, &block)
      else
        super(:textarea, *args) {}
      end
    end

  end
end