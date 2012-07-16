require 'spec_helper'

describe Table do

  context 'Types' do

    it 'default' do
      Table.new.to_s.should eq '<table class="table"></table>'
    end

    Table::TYPES.each do |type|
      it type do
        Table.new.send(type).to_s.should eq "<table class=\"table table-#{type}\"></table>"
      end
    end

  end

  context 'Constructors' do

    Table::TYPES.each do |type|
      it type do
        Table.send(type).to_s.should eq Table.new.send(type).to_s
      end
    end

  end

end