source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.2'
# Use Puma as the app server
gem 'puma', '3.12.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Twitter Bootstrap library for front-end UI and layout
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'

# Use Font Awesome sass gem for adding icons
gem 'font-awesome-sass', '4.6.2'

# Use Hirb for better database display in console
gem 'hirb', '~> 0.7.3'

# Use Devise for user authentication
gem 'devise', '~> 4.7', '>= 4.7.1'

# Use Stripe for payment processing
gem 'stripe', '1.48.0'

# Use Figaro for ENV variables
gem 'figaro', '1.1.1'

# Use Paperclip for image upload
# gem 'paperclip', '5.2.0'

# Boot large ruby/rails apps faster
gem 'bootsnap', '~> 1.4', '>= 1.4.6', require: false

# Validations for Active Storage (presence)
gem 'active_storage_validations', '~> 0.8.9'

# High-level wrapper for processing images for the web with ImageMagick
gem 'image_processing', '~> 1.10', '>= 1.10.3'

# Manipulate images with minimal use of memory via ImageMagick
gem 'mini_magick', '~> 4.10', '>= 4.10.1'

# Use ActionMailer with SendGrid's Web API
gem 'sendgrid-actionmailer', '~> 3.0', '>= 3.0.2'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.13'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.2', '>= 3.2.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
end

group :production do
  # Use the PostgreSQL gem for Heroku production servers
  gem 'pg', '0.18.4'
  
  # Official AWS Ruby gem for Amazon Simple Storage Service (Amazon S3)
  gem 'aws-sdk-s3', '~> 1.64', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
ruby '2.6.3'