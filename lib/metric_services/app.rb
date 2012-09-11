module MetricServices
  class App < Sinatra::Base
    def self.service(service)
      post "/#{service.hook_name}" do
        settings = params["settings"]
        site = params["site"]
        payload = params["metric"]

        service.receive(settings, site, payload)
        "#{service.hook_name}"
      end
    end
  end
end
