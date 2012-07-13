require 'spec_helper'

describe Input do

  Input::TYPES.each do |type|
    it type do
      Input.send(type, :id => 'input_1').to_s.should eq "<input type=\"#{type}\" id=\"input_1\" />"
    end
  end

end