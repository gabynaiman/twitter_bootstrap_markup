require 'spec_helper'

describe Popover do

  it 'default' do
    Link.new('advanced', '#').popover('Title popover', 'This is a full explanation').to_s.should eq HtmlHelper.html_for('popovers', "#default a")
  end

  Tooltip::POSITIONS.reject { |p| p ==:right }.each do |position|
    it position do
      Link.new('advanced', '#').send("popover_#{position}", 'Title popover', 'This is a full explanation').to_s.should eq HtmlHelper.html_for('popovers', "##{position} a")
    end
  end

end