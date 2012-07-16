require 'spec_helper'

describe ControlGroup do

  context 'Types' do

    it 'default' do
      ControlGroup.new('Label') { append Input.text }.to_s.should eq HtmlHelper.html_for('control_groups', "#default .control-group")
    end

    ControlGroup::TYPES.each do |type|
      it type do
        ControlGroup.new('Label') { append Input.text }.send(type).to_s.should eq HtmlHelper.html_for('control_groups', "##{type} .control-group")
      end
    end

  end

  context 'Constructors' do

    ControlGroup::TYPES.each do |type|
      it type do
        ControlGroup.send(type, 'Label') { append Input.text }.to_s.should eq ControlGroup.new('Label') { append Input.text }.send(type).to_s
      end
    end

  end

end