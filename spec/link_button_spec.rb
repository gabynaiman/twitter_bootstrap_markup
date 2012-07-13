require 'spec_helper'

describe LinkButton do

  context 'Types' do
    it 'default' do
      LinkButton.new('Click me', '#').to_s.should eq HtmlHelper.html_for('link_buttons', "#default a")
    end

    LinkButton::TYPES.each do |type|
      it type do
        LinkButton.new('Click me', '#').send(type).to_s.should eq HtmlHelper.html_for('link_buttons', "##{type} a")
      end
    end
  end

  context 'Sizes' do
    LinkButton::SIZES.each do |size|
      it size do
        LinkButton.new('Click me', '#').send(size).to_s.should eq HtmlHelper.html_for('link_buttons', "##{size} a")
      end
    end
  end

  it 'Mixed' do
    LinkButton.new('Click me', '#').primary.large.to_s.should eq HtmlHelper.html_for('link_buttons', "#mixed a")
  end

  context 'Constructors' do

    LinkButton::TYPES.each do |type|
      it type do
        LinkButton.send(type, 'Click me', '#').to_s.should eq LinkButton.new('Click me', '#').send(type).to_s
      end
    end

    LinkButton::SIZES.each do |size|
      it size do
        LinkButton.send(size, 'Click me', '#').to_s.should eq LinkButton.new('Click me', '#').send(size).to_s
      end
    end

    LinkButton::TYPES.each do |type|
      LinkButton::SIZES.each do |size|
        it "#{type}_#{size}" do
          LinkButton.send("#{type}_#{size}", 'Click me', '#').to_s.should eq LinkButton.new('Click me', '#').send(type).send(size).to_s
        end
      end
    end
  end  

end