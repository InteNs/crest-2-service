source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6'

gem 'dotenv-rails'

gem 'rails', '~> 6.0'

# postgres db
gem 'pg'

gem 'faraday'

# puma webserver
gem 'puma'

gem 'bootsnap', require: false
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails'
  gem "factory_bot_rails"
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end
