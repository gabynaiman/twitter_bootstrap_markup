require 'spec_helper'

describe Form do

  context 'Types' do

    Form::TYPES.each do |type|
      it type do
        tag = Form.new do
          append Input.text(:class => 'input-small', :placeholder => 'Email')
          append Input.password(:class => 'input-small', :placeholder => 'Password')
          append(Tag.new(:label, :class => 'checkbox') do
            append Input.checkbox
            append 'Remember me'
          end)
          append Button.new('Sign in')
        end

        tag.send(type).to_s.should eq HtmlHelper.html_for('forms', "##{type} form")
      end
    end

  end

  context 'Constructors' do

    Form::TYPES.each do |type|
      it type do
        Form.send(type).to_s.should eq Form.new.send(type).to_s
      end
    end

  end

end