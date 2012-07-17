require 'spec_helper'

describe Divider do

  it 'horizontal' do
    Divider.horizontal.to_s.should eq '<li class="divider"></li>'
  end

  it 'vertical' do
    Divider.vertical.to_s.should eq '<li class="divider-vertical"></li>'
  end

  it 'breadcrumb' do
    Divider.breadcrumb.to_s.should eq '<span class="divider">/</span>'
  end

end