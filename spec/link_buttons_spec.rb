require 'spec_helper'

describe LinkButton do

  BUTTON_TYPES.each do |type|
    it type do
      LinkButton.send(type, 'Click me', '#').html.should eq HtmlHelper.html_for('link_buttons', "##{type} a")
    end
  end

end