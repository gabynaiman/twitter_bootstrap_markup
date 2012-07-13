module TwitterBootstrapMarkup
  class ButtonBase < Tag
    TYPES = [:primary, :info, :success, :warning, :danger, :inverse]
    SIZES = [:large, :small, :mini]

    SIZES.each do |size|
      define_method size do
        self.attributes.append!(:class, "btn-#{size}")
        self
      end
    end
  end
end