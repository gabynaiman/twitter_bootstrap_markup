require 'spec_helper'

describe PageHeader do

  it 'title' do
    PageHeader.new('Page Title').to_s.should eq '<div class="page-header"><h1>Page Title</h1></div>'
  end

  it 'title and subtitle' do
    PageHeader.new('Page Title', 'Subtitle').to_s.should eq '<div class="page-header"><h1>Page Title<small>Subtitle</small></h1></div>'
  end

end