require 'spec_helper'

describe NavList do

  it 'default' do
    tag = NavList.new do
      append NavHeader.new 'Title'
      append do
        Link.new('#') do
          append Icon.new('search')
          append 'Search'
        end
      end
      append do
        Link.new('#') do
          append Icon.new('file')
          append 'New'
        end
      end
      append Divider.horizontal
      append 'Help'
    end

    tag.to_s.should eq HtmlHelper.html_for('nav_lists', "#default div")
  end

end