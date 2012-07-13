require 'spec_helper'

describe Button do

  context 'Types' do
    it 'default' do
      Button.new('Click me').html.should eq HtmlHelper.html_for('buttons', "#default button")
    end

    ButtonBase::TYPES.each do |type|
      it type do
        Button.send(type, 'Click me').html.should eq HtmlHelper.html_for('buttons', "##{type} button")
      end
    end
  end

  context 'Sizes' do
    ButtonBase::SIZES.each do |size|
      it size do
        Button.new('Click me').send(size).html.should eq HtmlHelper.html_for('buttons', "##{size} button")
      end
    end
  end

end