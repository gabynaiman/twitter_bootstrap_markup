require 'spec_helper'

describe Button do

  BUTTON_TYPES.each do |type|
    it type do
      Button.send(type, 'Click me').html.should eq HtmlHelper.html_for('buttons', "##{type} button")
    end
  end

end