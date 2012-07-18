require 'spec_helper'

describe Tab do

  it 'default' do
    tag = Tab.new do
      nav.append NavTab.new('Tab 1', '#tab1'), :active
      nav.append NavTab.new('Tab 2', '#tab2')
      nav.append NavTab.new('#tab3') { append 'Tab 3' }
      content.append('tab1', :active) do
        Tag.block :i, 'Content for Tab 1'
      end
      content.append 'tab2', 'Content for Tab 2'
      content.append('tab3') do
        Tag.block :strong, 'Content for Tab 3'
      end
    end

    tag.to_s.should eq HtmlHelper.html_for('tabs', "#default .tab")
  end

end