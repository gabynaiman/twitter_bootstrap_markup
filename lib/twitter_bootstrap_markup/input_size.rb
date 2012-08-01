module TwitterBootstrapMarkup
  module InputSize
    VALUES = [:mini, :small, :medium, :large, :xlarge, :xxlarge]

    module InstanceMethods
      VALUES.each do |size|
        define_method(size) do
          attributes.append!(:class, "input-#{size}")
          self
        end
      end
    end

    module ClassMethods
      VALUES.each do |size|
        define_method(size) do |*args, &block|
          self.new(*args, &block).send(size)
        end
      end
    end
  end
end