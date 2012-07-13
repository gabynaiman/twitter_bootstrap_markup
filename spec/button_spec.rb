require 'spec_helper'

describe Button do

  context 'Types' do
    it 'default' do
      Button.new('Click me').to_s.should eq HtmlHelper.html_for('buttons', "#default button")
    end

    ButtonBase::TYPES.each do |type|
      it type do
        Button.new('Click me').send(type).to_s.should eq HtmlHelper.html_for('buttons', "##{type} button")
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

  it 'Mixed' do
    Button.new('Click me').primary.large.to_s.should eq HtmlHelper.html_for('buttons', "#mixed button")
  end

  context 'Constructors' do

    ButtonBase::TYPES.each do |type|
      it type do
        Button.send(type, 'Click me').to_s.should eq Button.new('Click me').send(type).to_s
      end
    end

    ButtonBase::SIZES.each do |size|
      it size do
        Button.send(size, 'Click me').to_s.should eq Button.new('Click me').send(size).to_s
      end
    end

    ButtonBase::TYPES.each do |type|
      ButtonBase::SIZES.each do |size|
        it "#{type}_#{size}" do
          Button.send("#{type}_#{size}", 'Click me').to_s.should eq Button.new('Click me').send(type).send(size).to_s
        end
      end
    end
  end

end