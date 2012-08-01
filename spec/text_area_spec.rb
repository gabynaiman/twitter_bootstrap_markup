require 'spec_helper'

describe Textarea do

  context 'Sizes' do

    it 'default' do
      Textarea.new.to_s.should eq HtmlHelper.html_for('textareas', "#default textarea")
    end

    InputSize::VALUES.each do |size|
      it size do
        Textarea.new.send(size).to_s.should eq HtmlHelper.html_for('textareas', "##{size} textarea")
      end
    end

  end

  context 'Rows' do

    [5,10].each do |rows|
      it "#{rows} rows" do
        Textarea.new(:rows => rows).to_s.should eq HtmlHelper.html_for('textareas', "##{rows}rows textarea")
      end
    end

  end

  it 'mixed' do
    Textarea.new(:rows => 5).xxlarge.to_s.should eq HtmlHelper.html_for('textareas', "#mixed textarea")
  end

  context 'Constructors' do

    InputSize::VALUES.each do |size|
      it size do
        Textarea.send(size, :rows => 8).to_s.should eq Textarea.new(:rows => 8).send(size).to_s
      end
    end

  end

end