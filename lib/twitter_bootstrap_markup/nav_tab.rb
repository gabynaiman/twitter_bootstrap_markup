module TwitterBootstrapMarkup
  class NavTab < Link

    def initialize(*args, &block)
      super(*args, &block)
      attributes['data-toggle'] = 'tab'
    end

  end
end