require 'spec_helper'

describe Brand do

  it 'default' do
    Brand.new('BrandName1', 'url1').to_s.should eq '<a class="brand" href="url1">BrandName1</a>'
    Brand.new('BrandName2', 'url2').to_s.should eq '<a class="brand" href="url2">BrandName2</a>'
  end

end