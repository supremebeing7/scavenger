Sidekiq.configure_client do |config|
  config.redis = { :url => ENV['SIDEKIQ_REDIS_URL'], :namespace => 'mynamespace', :size => 1 }
end
Sidekiq.configure_server do |config|
  config.redis = { :url => ENV['SIDEKIQ_REDIS_URL'], :namespace => 'mynamespace', :size => 2 }
end
