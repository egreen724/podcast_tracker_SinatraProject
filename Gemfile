source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '4.2.5', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'sinatra-flash'


group :development do
  gem 'sqlite3'
end

group :production do
   gem 'pg'
   gem 'activerecord-postgresql-adapter'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end
