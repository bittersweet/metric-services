begin
  require 'rubygems'
  require 'bundler'
rescue LoadError
  raise "Could not load Bundler"
end

Bundler.require

$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'metric_services'
