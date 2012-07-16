require 'spec_helper'

describe Badge do

  context 'Types' do

    it 'default' do
      Badge.new(1).to_s.should eq HtmlHelper.html_for('badges', "#default span")
    end

    LabelBase::TYPES.each do |type|
      it type do
        Badge.new(1).send(type).to_s.should eq HtmlHelper.html_for('badges', "##{type} span")
      end
    end

  end

  context 'Constructors' do

    LabelBase::TYPES.each do |type|
      it type do
        Badge.send(type, 1).to_s.should eq Badge.new(1).send(type).to_s
      end
    end

  end

end