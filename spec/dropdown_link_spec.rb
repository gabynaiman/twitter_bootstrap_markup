require 'spec_helper'

describe DropdownLink do

  it 'default' do
    tag = DropdownLink.new('Select option') do
      append Link.new('Option 1', '#1')
      append Link.new('Option 2', '#2')
    end

    tag.to_s.should eq HtmlHelper.html_for('dropdown_links', "#default div")
  end

  it 'image' do
    tag = DropdownLink.new('Select option') do
      append(Link.new('#1') do
        append Icon.new('search')
        append 'Option 1'
      end)
      append(Link.new('#2') do
        append Icon.new('star')
        append 'Option 2'
      end)
    end

    tag.to_s.should eq HtmlHelper.html_for('dropdown_links', "#image div")
  end

  it 'divider' do
    tag = DropdownLink.new('Select option') do
      append Link.new('Option 1', '#1')
      append Divider.horizontal
      append Link.new('Option 2', '#2')
    end

    tag.to_s.should eq HtmlHelper.html_for('dropdown_links', "#divider div")
  end

end