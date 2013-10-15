source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'   #local minimal db
  gem 'railroady' #generate diagram in svg format
end

group :production do
  gem 'mysql2'
  gem 'therubyracer'
end


# handle more requests than WEBrick
gem 'unicorn'          

# use setting YML file for config
gem 'settingslogic'

# jquery file upload
gem 'jquery-fileupload-rails'

# paperclip : photo resizing (ImageMagick)
# installation : https://github.com/thoughtbot/paperclip
gem 'paperclip'

# dalli - mem cache
# installation : https://github.com/mperham/dalli
gem 'dalli'

# cas authentication
gem 'rubycas-client-rails'

# ldap infos (mail, name, etc.)
gem 'activeldap', :require => 'active_ldap/railtie'
gem 'ruby-ldap'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
