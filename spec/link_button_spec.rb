require 'spec_helper'

describe LinkButton do

  context 'Types' do
    it 'default' do
      LinkButton.new('Click me', '#').to_s.should eq HtmlHelper.html_for('link_buttons', "#default a")
    end

    ButtonBase::TYPES.each do |type|
      it type do
        LinkButton.send(type, 'Click me', '#').to_s.should eq HtmlHelper.html_for('link_buttons', "##{type} a")
      end
    end
  end

  context 'Sizes' do
    ButtonBase::SIZES.each do |size|
      it size do
        LinkButton.new('Click me', '#').send(size).to_s.should eq HtmlHelper.html_for('link_buttons', "##{size} a")
      end
    end
  end

end