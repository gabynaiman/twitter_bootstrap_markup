require 'rubygems'
require 'bundler/setup'
require 'twitter_bootstrap_markup'
require 'nokogiri'

include TwitterBootstrapMarkup

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end