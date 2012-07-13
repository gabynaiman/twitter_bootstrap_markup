require 'spec_helper'

describe Link do

  it 'text and url' do
    Link.new('text', 'url').to_s.should eq '<a href="url">text</a>'
  end

  it 'text and url with aditional attributes' do
    Link.new('text', 'url', :title => 'link').to_s.should eq '<a href="url" title="link">text</a>'
  end

  it 'url and block' do
    Link.new('url') { append Tag.block(:strong) { append 'text' } }.to_s.should eq '<a href="url"><strong>text</strong></a>'
  end

  it 'url and block with aditional attributes' do
    Link.new('url', :title => 'link') { append Tag.block(:strong) { append 'text' } }.to_s.should eq '<a href="url" title="link"><strong>text</strong></a>'
  end

  it 'url, image and text' do
    tag = Link.new('url') do
      append Icon.new('search')
      append 'Search'
    end
    tag.to_s.should eq '<a href="url"><i class="icon-search"></i>Search</a>'
  end

end