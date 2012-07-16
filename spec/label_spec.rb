require 'spec_helper'

describe Label do

  context 'Types' do

    it 'default' do
      Label.new('Default').to_s.should eq HtmlHelper.html_for('labels', "#default span")
    end

    LabelBase::TYPES.each do |type|
      it type do
        Label.new(type.to_s.capitalize).send(type).to_s.should eq HtmlHelper.html_for('labels', "##{type} span")
      end
    end

  end

  context 'Constructors' do

    LabelBase::TYPES.each do |type|
      it type do
        Label.send(type, type.to_s.capitalize).to_s.should eq Label.new(type.to_s.capitalize).send(type).to_s
      end
    end

  end

end