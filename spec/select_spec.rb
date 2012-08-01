require 'spec_helper'

describe Select do

  context 'Options' do

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
      Select.new(options, :id => 'group_select').to_s.should eq HtmlHelper.html_for('selects', "#group select")
    end

    it 'selected value' do
      Select.new([1, 2, 3], :selected_value => 2, :id => 'selected_select').to_s.should eq HtmlHelper.html_for('selects', "#selected select")
    end

    it 'prompt' do
      Select.new([1, 2], :prompt => '[Select option]', :id => 'prompt_select').to_s.should eq HtmlHelper.html_for('selects', "#prompt select")
    end

  end

  context 'Sizes' do

    InputSize::VALUES.each do |size|
      it size do
        Select.new.send(size).to_s.should eq HtmlHelper.html_for('selects', "##{size} select")
      end
    end

  end

  context 'Constructors' do

    InputSize::VALUES.each do |size|
      it size do
        Select.send(size).to_s.should eq Select.new.send(size).to_s
      end
    end

  end

end