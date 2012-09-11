require 'spec_helper'

describe Service::Email do
  it "adds itself to services array" do
    Service.services.should == [MetricServices::Service::Email]
  end

  it "returns correct name" do
    Service::Email.hook_name.should == "email"
  end

  it "processes payload" do
    Service::Email.receive("markmulder@gmail.com", "metric.io", payload)
    email = Mail::TestMailer.deliveries.first
    email.from.should == ["info@metric.io"]
    email.to.should == ["markmulder@gmail.com"]
    email.subject.should == "[metric.io] alert for signup on metric.io"
  end
end
