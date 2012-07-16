require 'spec_helper'

describe ControlGroup do

  it 'text field' do
    tag = ControlGroup.new('Field Label', :for => 'field_name') do
      append Input.text :id => 'field_name'
    end

    tag.to_s.should eq HtmlHelper.html_for('control_groups', "#text_field .control-group")
  end

end