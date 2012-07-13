require 'spec_helper'

describe DropdownButton do

  it 'default' do
    tag = DropdownButton.new('Select option') do
      append Link.new('Option 1', '#1')
      append Link.new('Option 2', '#2')
    end

    tag.html.should eq HtmlHelper.html_for('dropdown_buttons', "#default div")
  end

end