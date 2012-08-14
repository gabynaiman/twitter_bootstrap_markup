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

  it 'Usage without a constructor block' do
    nav_list_1 = NavList.new do
      append NavHeader.new 'Title'
      append Link.new('text', '#')
    end

    nav_list_2 = NavList.new
    nav_list_2.append NavHeader.new 'Title'
    nav_list_2.append Link.new('text', '#')

    nav_list_1.to_s.should eq nav_list_2.to_s
  end

end