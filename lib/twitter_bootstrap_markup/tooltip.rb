module TwitterBootstrapMarkup
  module Tooltip
    POSITIONS = [:top, :bottom, :left, :right]

    def tooltip(title)
      tooltip_top(title)
    end

    POSITIONS.each do |position|
      define_method "tooltip_#{position}" do |title|
        attributes[:rel] = 'tooltip'
        attributes['data-original-title'] = title
        attributes['data-placement'] = position
        self
      end
    end

  end
end