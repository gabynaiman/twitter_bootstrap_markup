require 'spec_helper'

describe TagBuilder do

  it 'tag' do
    TagBuilder.tag(:input, :type => 'button').to_s.should eq Tag.inline(:input, :type => 'button').to_s
  end

  it 'inline' do
    TagBuilder.tag_inline(:input, :type => 'button').to_s.should eq Tag.inline(:input, :type => 'button').to_s
  end

  it 'block' do
    TagBuilder.tag_block(:div, 'content').to_s.should eq Tag.block(:div, 'content').to_s
    TagBuilder.tag_block(:div) { append 'content' }.to_s.should eq Tag.block(:div) { append 'content' }.to_s
  end

  it 'link' do
    TagBuilder.link('Title', 'url').to_s.should eq Link.new('Title', 'url').to_s
  end

  it 'input_text' do
    TagBuilder.input_text(:value => 'text').to_s.should eq Input.text(:value => 'text').to_s
  end

  it 'input text small' do
    TagBuilder.input_text_small(:value => 'text').to_s.should eq Input.text_small(:value => 'text').to_s
  end

  it 'button primary mini' do
    TagBuilder.button_primary_mini('Click').to_s.should eq Button.primary_mini('Click').to_s
  end

end