if Rails.env.development?
  # set MemoryStore
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
  Rack::MiniProfiler.config.skip_paths << "/dev-assets/"
  Rack::MiniProfiler.config.skip_paths << "/assets/"
  Rack::MiniProfiler.config.skip_paths << "/system/"
  Rack::MiniProfiler.config.skip_paths << "/files/"

  Rack::MiniProfiler.config.start_hidden = true
end