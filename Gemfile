source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



platforms :jruby do
  gem 'jruby-openssl'
  gem 'therubyrhino'
  gem 'activerecord-jdbcsqlite3-adapter'
end

platforms :ruby do
  gem 'therubyracer'
  gem 'sqlite3'
  gem 'mysql2'
  gem "unicorn", "~> 4.4.0"
  gem "wkhtmltopdf-binary", "~> 0.9.9.1"
end

group :development do
  gem 'capistrano-unicorn'
end

# capistrano
gem 'capistrano'

# Gmaps4Rails
gem 'gmaps4rails'

# Devise
gem 'devise'

# GeoCoding
gem "geocoder"

# QR Code
gem "rqrcode"

#PDF - requires wkhtmltopdf installed
gem 'wicked_pdf'

# Building Wizards
gem 'wicked' , :git => "git://github.com/schneems/wicked.git"

# Voting 
gem 'thumbs_up'

#MetaWhere
#gem "meta_where"

#ActiveAdmin

  gem 'activeadmin'
  gem "meta_search",    '>= 1.1.0.pre'
  gem 'less-rails' 

#SimpleForm
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
