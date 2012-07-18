require 'spec_helper'

describe Well do

  it 'default' do
    Well.new('This is a well').to_s.should eq '<div class="well">This is a well</div>'
  end

  it 'small' do
    Well.small('This is a small well').to_s.should eq '<div class="well well-small">This is a small well</div>'
  end

  it 'large' do
    Well.large('This is a large well').to_s.should eq '<div class="well well-large">This is a large well</div>'
  end

end