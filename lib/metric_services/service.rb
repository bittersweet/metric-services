require_relative 'helper'

module MetricServices
  class Service
    include MetricServices::Helper

    attr_reader :settings
    attr_reader :site
    attr_reader :payload

    def initialize(settings, site, payload)
      @settings = settings
      @site = site
      @payload = payload
    end

    def self.receive(settings, site, payload)
      service = new(settings, site, payload)
      service.receive_event
    end

    def self.services
      @services ||= []
    end

    # add inherited class to services array and setup routes in app
    def self.inherited(sub)
      Service.services << sub
      MetricServices::App.service(sub)
    end

    def self.hook_name
      name.split("::").last.downcase
    end
  end
end

::Service = MetricServices::Service
require_relative '../../services/email.rb'
