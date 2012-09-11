require './config/bootstrap'
require 'metric_services'
require 'net/http'

parameters = {
  "settings" => "markmulder@gmail.com",
  "site" => "metric.io",
  "metric[metric]" => "signup",
  "metric[amount]" => "1",
  "metric[time]" => Time.now
}

uri = URI.parse("http://localhost:9292/email")
response = Net::HTTP.post_form(uri, parameters)

p response
