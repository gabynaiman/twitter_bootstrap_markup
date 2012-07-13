require 'spec_helper'

describe DropdownButton do

  context 'Types' do
    it 'default' do
      tag = DropdownButton.new('Select option') do
        append Link.new('Option 1', '#1')
        append Link.new('Option 2', '#2')
      end

      tag.to_s.should eq HtmlHelper.html_for('dropdown_buttons', "#default div")
    end

    Button::TYPES.each do |type|
      it type do
        tag = DropdownButton.new('Select option') do
          append Link.new('Option 1', '#1')
          append Link.new('Option 2', '#2')
        end

        tag.send(type).to_s.should eq HtmlHelper.html_for('dropdown_buttons', "##{type} div")
      end
    end
  end

  context 'Sizes' do
    Button::SIZES.each do |size|
      it size do
        tag = DropdownButton.new('Select option') do
          append Link.new('Option 1', '#1')
          append Link.new('Option 2', '#2')
        end

        tag.send(size).to_s.should eq HtmlHelper.html_for('dropdown_buttons', "##{size} div")
      end
    end
  end

  it 'Mixed' do
    tag = DropdownButton.new('Select option') do
      append Link.new('Option 1', '#1')
      append Link.new('Option 2', '#2')
    end

    tag.primary.large.to_s.should eq HtmlHelper.html_for('dropdown_buttons', "#mixed div")
  end

  context 'Constructors' do

    Button::TYPES.each do |type|
      it type do
        DropdownButton.send(type, 'Select option').to_s.should eq DropdownButton.new('Select option').send(type).to_s
      end
    end

    Button::SIZES.each do |size|
      it size do
        DropdownButton.send(size, 'Select option').to_s.should eq DropdownButton.new('Select option').send(size).to_s
      end
    end

    Button::TYPES.each do |type|
      Button::SIZES.each do |size|
        it "#{type}_#{size}" do
          DropdownButton.send("#{type}_#{size}", 'Select option').to_s.should eq DropdownButton.new('Select option').send(type).send(size).to_s
        end
      end
    end
  end

end