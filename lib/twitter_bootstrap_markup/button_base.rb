module TwitterBootstrapMarkup
  class ButtonBase < Tag
    TYPES = [:primary, :info, :success, :warning, :danger, :inverse]
    SIZES = [:large, :small, :mini]

    TYPES.each do |type|
      define_method type do
        attributes.append!(:class, "btn-#{type}")
        self
      end
    end

    SIZES.each do |size|
      define_method size do
        self.attributes.append!(:class, "btn-#{size}")
        self
      end
    end
  end
end