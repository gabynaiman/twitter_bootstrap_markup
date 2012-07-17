module TwitterBootstrapMarkup
  module Popover
    POSITIONS = [:top, :bottom, :left, :right]

    def popover(title, content)
      popover_right(title, content)
    end

    POSITIONS.each do |position|
      define_method "popover_#{position}" do |title, content|
        attributes[:rel] = 'popover'
        attributes['data-original-title'] = title
        attributes['data-content'] = content
        attributes['data-placement'] = position
        self
      end
    end

  end
end