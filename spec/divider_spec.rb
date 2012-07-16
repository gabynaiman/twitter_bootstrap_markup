require 'spec_helper'

describe Divider do

  it 'horizontal' do
    Divider.horizontal.to_s.should eq '<li class="divider"></li>'
  end

  it 'vertical' do
    Divider.vertical.to_s.should eq '<li class="divider-vertical"></li>'
  end

  it 'breadcrumbs' do
    Divider.breadcrumbs.to_s.should eq '<span class="divider">/</span>'
  end

end