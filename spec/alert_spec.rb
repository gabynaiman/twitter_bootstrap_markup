require 'spec_helper'

describe Alert do

  context 'Types' do

    Alert::TYPES.each do |type|
      it type do
        tag = Alert.new do
          append Tag.block(:strong) { append 'Alert!' }
          append 'Message'
        end

        tag.send(type).to_s.should eq HtmlHelper.html_for('alerts', "##{type} div")
      end
    end

    it 'closable' do
      tag = Alert.new do
        append Tag.block(:strong) { append 'Alert!' }
        append 'Message'
      end

      tag.closable.to_s.should eq HtmlHelper.html_for('alerts', "#closable div")
    end

  end

  context 'Constructors' do

    Alert::TYPES.each do |type|
      it type do
        tag1 = Alert.send(type) do
          append Tag.block(:strong) { append 'Alert!' }
          append 'Message'
        end

        tag2 = Alert.new do
          append Tag.block(:strong) { append 'Alert!' }
          append 'Message'
        end

        tag1.to_s.should eq tag2.send(type).to_s
      end

      it "#{type}_closable" do
        tag1 = Alert.send("#{type}_closable") do
          append Tag.block(:strong) { append 'Alert!' }
          append 'Message'
        end

        tag2 = Alert.new do
          append Tag.block(:strong) { append 'Alert!' }
          append 'Message'
        end

        tag1.to_s.should eq tag2.send(type).closable.to_s
      end
    end

    it 'closable' do
      tag1 = Alert.closable do
        append Tag.block(:strong) { append 'Alert!' }
        append 'Message'
      end

      tag2 = Alert.new do
        append Tag.block(:strong) { append 'Alert!' }
        append 'Message'
      end

      tag1.to_s.should eq tag2.closable.to_s
    end

  end

end
