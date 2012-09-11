require File.expand_path('../config/bootstrap', __FILE__)
require 'metric_services'

run MetricServices::App.new
