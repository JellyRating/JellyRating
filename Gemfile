source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'active_record_union'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Haml for templates
gem 'haml'

gem 'acts-as-taggable-on', '~> 3.4'

gem "select2-rails", ">= 4.0.0", github: 'nilbus/select2-rails', branch: 'full'

# Use bcrypt for password
gem 'bcrypt', '3.1.7'

# Use bootstrap-sass for css
gem 'bootstrap-sass', '3.2.0.0'

# Test framework
gem 'rspec-rails', '~> 3.3.2'

# Mock framework
gem 'mocha', '~> 1.1.0'

# Fixtures made easy
gem 'factory_girl_rails', '~> 4.5.0'

gem 'factory_girl_rspec', '~> 2.1.0'

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Acceptance tests
group :cucumber do
  gem 'cucumber', '~> 1.3.20'
  gem 'cucumber-rails'
  # Version fixed greater than 1.4.1. See:
  # https://github.com/DatabaseCleaner/database_cleaner/issues/317
  gem 'database_cleaner', '>= 1.4.1'
  gem 'poltergeist', '~> 1.6.0'
end

group :test do
  # Easier test writing
  gem "shoulda-matchers", "~> 2.8.0"

  # Test coverage
  gem 'simplecov', :require => false, :group => :test

  gem 'autotest-rails'


end

