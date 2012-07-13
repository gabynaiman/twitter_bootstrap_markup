require 'spec_helper'

describe Fieldset do

  it 'empty' do
    Fieldset.new.to_s.should eq '<fieldset></fieldset>'
  end

  it 'with legend' do
    Fieldset.new('Form title').to_s.should eq '<fieldset><legend>Form title</legend></fieldset>'
  end

  it 'container' do
    tag = Fieldset.new('Form title') do
      append Input.text
      append Input.button(:value => 'Click me')
    end

    tag.to_s.should eq '<fieldset><legend>Form title</legend><input type="text"><input type="button" value="Click me"></fieldset>'
  end

end