require 'spec_helper'

describe Select do

  it 'empty' do
    Select.new([], :id => 'empty_select').to_s.should eq HtmlHelper.html_for('selects', "#empty select")
  end

  it 'array options' do
    Select.new([1, 2], :id => 'array_select').to_s.should eq HtmlHelper.html_for('selects', "#array select")
  end

  it 'hash options' do
    Select.new({:option1 => 1, :option2 => 2}, :id => 'hash_select').to_s.should eq HtmlHelper.html_for('selects', "#hash select")
  end

  it 'hash options group' do
    options = {
        :group1 => [1, 2],
        :group2 => {
            :optionA => 'A',
            :optionB => 'B'
        }
    }
    puts Select.new(options, :id => 'group_select').to_s
    Select.new(options, :id => 'group_select').to_s.should eq HtmlHelper.html_for('selects', "#group select")
  end

  it 'selected value' do
    Select.new([1, 2, 3], :selected_value => 2, :id => 'selected_select').to_s.should eq HtmlHelper.html_for('selects', "#selected select")
  end

  it 'prompt' do
    Select.new([1,2], :prompt => '[Select option]', :id => 'prompt_select').to_s.should eq HtmlHelper.html_for('selects', "#prompt select")
  end

end