require 'spec_helper'

describe ProgressBar do

  context 'Types' do

    it 'default' do
      ProgressBar.new(60).to_s.should eq HtmlHelper.html_for('progress_bars', "#default .progress")
    end

    ProgressBar::TYPES.each do |type|
      it type do
        ProgressBar.new(60).send(type).to_s.should eq HtmlHelper.html_for('progress_bars', "##{type} .progress")
      end
    end

  end

  context 'Display' do

    it 'striped' do
      ProgressBar.new(60).striped.to_s.should eq HtmlHelper.html_for('progress_bars', "#striped .progress")
    end

    it 'striped animated' do
      ProgressBar.new(60).striped_animated.to_s.should eq HtmlHelper.html_for('progress_bars', "#animated .progress")
    end

    it 'mixed' do
      ProgressBar.info(60).striped.to_s.should eq HtmlHelper.html_for('progress_bars', "#mixed .progress")
    end

  end

  context 'Constructors' do

    ProgressBar::TYPES.each do |type|
      it type do
        ProgressBar.send(type, 60).to_s.should eq ProgressBar.new(60).send(type).to_s
      end

      it "#{type}_striped" do
        ProgressBar.send("#{type}_striped", 60).to_s.should eq ProgressBar.new(60).send(type).striped.to_s
      end

      it "#{type}_striped_animated" do
        ProgressBar.send("#{type}_striped_animated", 60).to_s.should eq ProgressBar.new(60).send(type).striped_animated.to_s
      end
    end

  end

end