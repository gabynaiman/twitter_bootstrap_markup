require 'spec_helper'

describe Tag do

  it 'Create simple tag' do
    Tag.inline(:input, :type => 'text', :id => 'text_field').html.should eq '<input type="text" id="text_field" />'
  end

  it 'Create simple tag in steps' do
    tag = Tag.inline(:input)
    tag.attributes[:type] = 'button'
    tag.attributes[:value] = 'Click me'

    tag.html.should eq '<input type="button" value="Click me" />'
  end

  it 'Create block tag' do
    Tag.block(:textarea, :id => 'long_text').html.should eq '<textarea id="long_text"></textarea>'
  end

  it 'Create block tag in steps' do
    tag = Tag.block(:body)
    tag.attributes[:style] = 'margin: 0px'

    tag.html.should eq '<body style="margin: 0px"></body>'
  end

  it 'Create text container tag' do
    Tag.block(:div, :style => 'width: 100%') { append 'Title' }.html.should eq '<div style="width: 100%">Title</div>'
  end

  it 'Create tag tree' do
    tag = Tag.block(:p) do
      append Tag.block(:label, :for => 'text_field') {append 'Text field:'}
      append Tag.inline(:input, :type => 'text', :id => 'text_field')
    end

    tag.html.should eq '<p><label for="text_field">Text field:</label><input type="text" id="text_field" /></p>'
  end
end