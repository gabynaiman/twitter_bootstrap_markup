require 'spec_helper'

describe Input, '-> text' do

  context 'Sizes' do

    it 'default' do
      Input.text.to_s.should eq HtmlHelper.html_for('textboxes', "#default input")
    end

    Input::SIZES.each do |size|
      it size do
        Input.text.send(size).to_s.should eq HtmlHelper.html_for('textboxes', "##{size} input")
      end
    end

  end

  context 'Constructors' do

    Input::SIZES.each do |size|
      it size do
        Input.send("text_#{size}").to_s.should eq Input.text.send(size).to_s
      end
    end

  end

end