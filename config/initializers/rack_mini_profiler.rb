# unless Rails.env.test?
#   require 'rack-mini-profiler'

#   uri = URI.parse(Rails.application.secrets.redis_url)
#   Rack::MiniProfiler.config.storage_options = {
#     host: uri.host, port: uri.port, password: uri.password
#   }
#   Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
#   Rack::MiniProfilerRails.initialize!(Rails.application)

#   Rails.application.middleware.delete(Rack::MiniProfiler)
#   Rails.application.middleware.insert_after(Rack::Deflater, Rack::MiniProfiler)
# end
