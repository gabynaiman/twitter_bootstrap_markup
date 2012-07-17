# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "twitter_bootstrap_markup/version"

Gem::Specification.new do |s|
  s.name        = 'twitter_bootstrap_markup'
  s.version     = TwitterBootstrapMarkup::VERSION
  s.authors     = ['Gabriel Naiman']
  s.email       = %w(gabynaiman@gmail.com)
  s.homepage    = 'https://github.com/gabynaiman/twitter_bootstrap_markup'
  s.summary     = 'Object Oriented Twitter Bootstrap Markup'
  s.description = 'Object Oriented Twitter Bootstrap Markup'

  s.rubyforge_project = 'twitter_bootstrap_markup'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'nokogiri'
end
