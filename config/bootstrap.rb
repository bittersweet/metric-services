begin
  require 'rubygems'
  require 'bundler'
rescue LoadError
  raise "Could not load Bundler"
end

begin
  # Set up load path for all bundled gems
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Did you run `bundle install`?"
end

Bundler.require

$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'metric_services'
