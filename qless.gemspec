# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qless/version"

Gem::Specification.new do |s|
  s.name        = "qless"
  s.version     = Qless::VERSION
  s.authors     = ["Dan Lecocq"]
  s.email       = ["dan@seomoz.org"]
  s.homepage    = "http://github.com/seomoz/qless"
  s.summary     = %q{A Redis-Based Queueing System}
  s.description = %q{
    `qless` is meant to be a performant alternative to other queueing
    systems, with statistics collection, a browser interface, and 
    strong guarantees about job losses.
    
    It's written as a collection of Lua scipts that are loaded into the
    Redis instance to be used, and then executed by the client library.
    As such, it's intended to be extremely easy to port to other languages,
    without sacrificing performance and not requiring a lot of logic
    replication between clients. Keep the Lua scripts updated, and your
    language-specific extension will also remain up to date.
    
    Updated by CC to work with ruby 1.9.3, redis 3.0, and other gems
  }

  s.rubyforge_project = "qless"

  s.files         = %w(README.md Gemfile Rakefile HISTORY.md)
  s.files        += Dir.glob("lib/**/*.rb")
  s.files        += Dir.glob("lib/qless/qless-core/*.lua")
  s.files        += Dir.glob("bin/**/*")
  s.files        += Dir.glob("lib/qless/server/**/*")
  s.bindir        = 'exe'
  s.executables   = [ "qless-web" ]

  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  
  s.add_dependency "redis", ">= 3.0.0"
  
  s.add_dependency "sinatra"     , ">= 1.3.2"
  s.add_dependency "vegas"       , ">= 0.1.11"
  s.add_dependency "thin"       

  s.add_development_dependency "rspec"       , ">= 2.12"
  s.add_development_dependency "rspec-fire"  , ">= 1.1"
  s.add_development_dependency "rake"        , ">= 10.0"
  s.add_development_dependency "capybara"    , ">= 1.1.2"
  s.add_development_dependency "poltergeist" , ">= 1.0"
  s.add_development_dependency "launchy"     , ">= 2.1.0"
  s.add_development_dependency "simplecov"   , ">= 0.6.2"
  s.add_development_dependency 'sentry-raven', ">= 0.4"
end
