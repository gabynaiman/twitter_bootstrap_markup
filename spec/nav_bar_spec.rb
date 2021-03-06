require 'spec_helper'

describe NavBar do

  [:default, :top, :bottom].each do |type|
    it type do
      tag = NavBar.send(type == :default ? :new : type) do
        append Brand.new 'Brand', '#'
        append do
          NavContainer.new do
            append Divider.vertical
            append Link.new('Link 1', '#'), :active
            append Link.new('Link 2', '#')
          end
        end
        append do
          NavContainer.new do
            append Link.new('#') { append Icon.white('off', :title => 'logout') }
          end.pull_right
        end
      end

      tag.to_s.should eq HtmlHelper.html_for('nav_bars', "##{type} .navbar")
    end
  end

  it 'Usage without a constructor block' do
    nav_bar_1 = NavBar.new do
      append Brand.new 'Brand', '#'
    end

    nav_bar_2 = NavBar.new
    nav_bar_2.append Brand.new 'Brand', '#'

    nav_bar_1.to_s.should eq nav_bar_2.to_s
  end

end