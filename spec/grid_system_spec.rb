require 'spec_helper'

describe 'Grid System' do

  it 'span1' do
    tag = GridRow.new do
      12.times do |i|
        append GridColumn.new(1) { append '1' }
      end
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#span1 .row")
  end

  it 'span4' do
    tag = GridRow.new do
      3.times do |i|
        append GridColumn.new(4) { append '4' }
      end
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#span4 .row")
  end

  it 'span6' do
    tag = GridRow.new do
      2.times do |i|
        append GridColumn.new(6) { append '6' }
      end
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#span6 .row")
  end

  it 'span12' do
    tag = GridRow.new do
      append GridColumn.new(12) { append '12' }
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#span12 .row")
  end

  it 'offset_middle' do
    tag = GridRow.new do
      append GridColumn.new(4) { append '4' }
      append GridColumn.new(4, 4) { append '4 offset 4' }
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#offset_middle .row")
  end

  it 'offset_odd' do
    tag = GridRow.new do
      append GridColumn.new(3, 3) { append '3 offset 3' }
      append GridColumn.new(3, 3) { append '3 offset 3' }
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#offset_odd .row")
  end

  it 'offset_left' do
    tag = GridRow.new do
      append GridColumn.new(8, 4) { append '8 offset 4' }
    end

    tag.to_s.should eq HtmlHelper.html_for('grid_system', "#offset_left .row")
  end

end