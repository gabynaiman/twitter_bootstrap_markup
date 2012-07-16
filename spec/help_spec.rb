require 'spec_helper'

describe Help do

  it 'inline' do
    Help.inline('Shown to the right of the field').to_s.should eq '<span class="help-inline">Shown to the right of the field</span>'
  end

  it 'block' do
    Help.block('Shown below the field').to_s.should eq '<p class="help-block">Shown below the field</p>'
  end

end