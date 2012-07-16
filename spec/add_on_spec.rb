require 'spec_helper'

describe AddOn do

  it 'text' do
    AddOn.new('$').to_s.should eq '<span class="add-on">$</span>'
    AddOn.new('.00').to_s.should eq '<span class="add-on">.00</span>'
  end

end