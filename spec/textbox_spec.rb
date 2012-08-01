require 'spec_helper'

describe Input, '-> text' do

  context 'Sizes' do

    it 'default' do
      Input.text.to_s.should eq HtmlHelper.html_for('textboxes', "#default input")
    end

    InputSize::VALUES.each do |size|
      it size do
        Input.text.send(size).to_s.should eq HtmlHelper.html_for('textboxes', "##{size} input")
      end
    end

  end

  context 'Constructors' do

    InputSize::VALUES.each do |size|
      it size do
        Input.send("text_#{size}").to_s.should eq Input.text.send(size).to_s
      end
    end

  end

  context 'Prepend and Append' do

    it 'prepend' do
      tag = ExtendedInput.new do
        append AddOn.new '$'
        append Input.text
      end

      tag.to_s.should eq HtmlHelper.html_for('textboxes', "#prepend div")
    end

    it 'append' do
      tag = ExtendedInput.new do
        append Input.text
        append Button.new 'Save'
      end

      tag.to_s.should eq HtmlHelper.html_for('textboxes', "#append div")
    end

    it 'prepend and append' do
      tag = ExtendedInput.new do
        append AddOn.new '$'
        append Input.text
        append Button.new 'Save'
      end

      tag.to_s.should eq HtmlHelper.html_for('textboxes', "#prepend_append div")
    end
  end

end