# Be sure to restart your server when you modify this file.
if Rails.env.development? || Rails.env.test?
  Rails.application.config.session_store :cookie_store, key: '_socialist_session'
else
  Rails.application.config.session_store :redis_store,
    redis_server: Rails.application.secrets.redis_url
end
