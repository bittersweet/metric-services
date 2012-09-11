require File.expand_path('../../config/bootstrap', __FILE__)

Mail.defaults do
  delivery_method :test
end

def payload
  {"metric" => "signup", "amount" => 1, "time" => Time.now}
end

