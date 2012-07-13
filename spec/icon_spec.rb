require 'spec_helper'

describe Icon do

  it 'simple' do
    Icon.new('search').to_s.should eq '<i class="icon-search"></i>'
    Icon.new('file').to_s.should eq '<i class="icon-file"></i>'
  end

  it 'withe' do
    Icon.new('search').white.to_s.should eq '<i class="icon-search icon-white"></i>'
  end

end