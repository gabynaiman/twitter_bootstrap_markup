require 'spec_helper'

describe Breadcrumb do

  it 'one level' do
    tag = Breadcrumb.new do
      append 'Home'
    end

    tag.to_s.should eq HtmlHelper.html_for('breadcrumbs', "#one ul")
  end

  it 'two levels' do
    tag = Breadcrumb.new do
      append Link.new 'Home', '#'
      append 'Page'
    end

    tag.to_s.should eq HtmlHelper.html_for('breadcrumbs', "#two ul")
  end

  it 'three levels' do
    tag = Breadcrumb.new do
      append Link.new 'Home', '#'
      append Link.new 'Page', '#'
      append 'Data'
    end

    tag.to_s.should eq HtmlHelper.html_for('breadcrumbs', "#three ul")
  end

end
