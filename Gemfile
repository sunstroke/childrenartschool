source 'http://rubygems.org'

gem 'rails', '3.0.9'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'

gem "compass", ">= 0.11.5"
gem "haml"
gem "html5-boilerplate"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

gem 'carrierwave', ">= 0.5.6"
gem 'mini_magick'
gem 'flash_cookie_session'
gem "paperclip", "~> 2.3"
gem 'jquery-rails', '>= 1.0.12'
gem "ckeditor", "~> 3.6.0"
#gem "omniauth" 

gem 'negative-captcha', :git => 'git://github.com/stefants/negative-captcha.git'
gem "russian"
#gem 'rails-i18n'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

gem "nifty-generators", :group => :development
group :development, :test do
  #   gem 'webrat'
  gem 'sqlite3'
  gem 'web-app-theme', '>= 0.6.2'
  gem 'hpricot'
  gem 'ruby_parser'
end
 
 
group :production do
  gem 'pg', '>=0.11.0'
  gem 'web-app-theme', '>= 0.6.2'
  gem 'hpricot'
  gem 'ruby_parser'
end