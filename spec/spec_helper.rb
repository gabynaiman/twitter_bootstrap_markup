require 'rubygems'
require 'bundler/setup'
require 'twitter_bootstrap_markup'
require 'nokogiri'

include TwitterBootstrapMarkup

BUTTON_TYPES = [:default, :primary, :info, :success, :warning, :danger, :inverse]

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end