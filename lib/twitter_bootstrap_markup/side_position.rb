module TwitterBootstrapMarkup
  module SidePosition

    def pull_right
      attributes.append!(:class, 'pull-right')
      self
    end

    def pull_left
      attributes.append!(:class, 'pull-left')
      self
    end

  end
end