module TwitterBootstrapMarkup
  class Submit < Button

    def initialize(*args, &block)
      super(*args, &block)
      attributes[:type] = 'submit'
    end

  end
end