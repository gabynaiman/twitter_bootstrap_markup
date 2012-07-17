require 'spec_helper'

describe Tooltip do

  it 'default' do
    Link.new('simple', '#').tooltip('Simple tooltip').to_s.should eq HtmlHelper.html_for('tooltips', "#default a")
  end

  Tooltip::POSITIONS.reject { |p| p ==:top }.each do |position|
    it position do
      Link.new('simple', '#').send("tooltip_#{position}", 'Simple tooltip').to_s.should eq HtmlHelper.html_for('tooltips', "##{position} a")
    end
  end

end