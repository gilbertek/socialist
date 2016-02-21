if defined?(Rack::Timeout)
  if Rails.env.development?
    Rack::Timeout.timeout = false
  elsif Rails.env.production? || Rails.env.staging?
    Rack::Timeout.timeout = (ENV['RACK_TIMEOUT'] || 20).to_i
  end
end
