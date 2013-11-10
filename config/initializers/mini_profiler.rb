# set MemoryStore
Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
Rack::MiniProfiler.config.skip_paths << "/dev-assets/"
Rack::MiniProfiler.config.skip_paths << "/assets/"
Rack::MiniProfiler.config.skip_paths << "/system/"
Rack::MiniProfiler.config.skip_paths << "/files/"

Rack::MiniProfiler.config.start_hidden = true

# set RedisStore
if Rails.env.production?
  uri = URI.parse("localhost:6379")
  Rack::MiniProfiler.config.storage_options = { :host => uri.host, :port => uri.port }
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
end