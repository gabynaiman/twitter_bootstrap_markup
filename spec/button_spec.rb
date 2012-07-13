require 'spec_helper'

describe Button do

  context 'Types' do
    it 'default' do
      Button.new('Click me').to_s.should eq HtmlHelper.html_for('buttons', "#default button")
    end

    ButtonBase::TYPES.each do |type|
      it type do
        Button.send(type, 'Click me').to_s.should eq HtmlHelper.html_for('buttons', "##{type} button")
      end
    end
  end

  context 'Sizes' do
    ButtonBase::SIZES.each do |size|
      it size do
        Button.new('Click me').send(size).to_s.should eq HtmlHelper.html_for('buttons', "##{size} button")
      end
    end
  end

end