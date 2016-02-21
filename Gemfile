source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise'
gem 'devise-async'
gem 'geocoder'
gem 'httparty'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg', '~> 0.15'
gem 'premailer-rails'
gem 'puma'
gem 'pundit'
gem 'rack-cache'
gem 'rack-cors'
gem 'rails', '4.2.5.1'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sinatra' # for sidekiq webview
gem 'slim-rails'
# gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :rbx]
  gem 'derailed'
  gem 'html2slim'
  gem 'guard-annotate'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'letter_opener' # Read Actionmailer emails instead of sending
  gem 'scss_lint', require: false
  gem 'quiet_assets'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rack-livereload'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'ffaker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'timecop'
end

group :test do
  gem 'capybara', '~> 2.5'
  gem 'capybara-screenshot'
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'turnip'
  gem 'vcr', '~> 2.9.3'
  gem 'webmock'
end

group :staging, :production do
  gem 'dragonfly-s3_data_store'
  gem 'lograge'
  gem 'rack-timeout'
  gem 'rails_12factor'
end
