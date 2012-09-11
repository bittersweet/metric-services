require 'spec_helper'

describe MetricServices::App do
  include Rack::Test::Methods

  def app
    MetricServices::App
  end

  it "responds to email route" do
    parameters = {
      "settings" => "markmulder@gmail.com",
      "site" => "metric.io",
      "metric" => {"metric" => "signup", "amount" => 1, "time" => Time.now}
    }
    post "/email", params = parameters
    last_response.status.should == 200
  end
end
