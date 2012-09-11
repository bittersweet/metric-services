module MetricServices
  module Helper
    def erb(template, target_binding)
      ERB.new(template, nil, '-').result(target_binding)
    end
  end
end
