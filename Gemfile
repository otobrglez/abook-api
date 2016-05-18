source 'https://rubygems.org'

ruby '2.3.1'

gem 'grape'
gem 'puma'
gem 'pg'
gem 'activerecord', '~> 4.2'


group :test do
	gem 'rspec'
	gem 'rack-test'
  gem 'shoulda-matchers'
end

group :development do
	gem 'guard'
	gem 'guard-rspec'
end

group :test, :development do
	gem 'pry'
  gem 'factory_girl'
end
