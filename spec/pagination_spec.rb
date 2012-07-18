require 'spec_helper'

describe Pagination do

  [:default, :centered, :right].each do |position|
    it position do
      tag = Pagination.send(position == :default ? :new : position) do
        append Tag.new(:a, 'Prev'), :active
        append Tag.new(:a, 1), :active
        append Link.new(2, '#')
        append Link.new('Next', '#')
      end

      tag.to_s.should eq HtmlHelper.html_for('paginations', "##{position} .pagination")
    end
  end

end