# Disable Sidekiq on production until ready to launch - costs money on Heroku.
if Rails.env.development?
  Sidekiq.configure_client do |config|
    namespace= ENV['RACK_ENV']=='production' ? 'sidekiq' : 'sidekiq-dev'
    config.redis = { :url => ENV['SIDEKIQ_REDIS_URL'], :namespace => namespace, :size => 1 }
  end
  Sidekiq.configure_server do |config|
    namespace= ENV['RACK_ENV']=='production' ? 'sidekiq' : 'sidekiq-dev'
    config.redis = { :url => ENV['SIDEKIQ_REDIS_URL'], :namespace => namespace, :size => 2 }
  end
end
