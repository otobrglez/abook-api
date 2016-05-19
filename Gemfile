source 'https://rubygems.org'

ruby '2.3.1'

# Ruby Grape gem
gem 'grape'

# Swagger for building nice documentation
gem 'grape-swagger'

# Puma Ruby web server.
gem 'puma'

# PG is gem for PostgreSQL
gem 'pg'

# ActiveRecord... Well... You kind a need it. :D
gem 'activerecord', '~> 4.2'

# This is hashite thing. This is needed to skip active record forbidden attributes security thing.
gem 'hashie-forbidden_attributes'

# Rack adapter for CORS. So that we can access this API from different domain or smthing.
# This is useful for swagger ui.
gem 'rack-cors'

# Nothing special here
group :test do
	gem 'rspec'
	gem 'rack-test'

  # Should matchers. Gotta love those.
  gem 'shoulda-matchers'
end


# Continues development... With Guard. Easy.
group :development do
	gem 'guard'
	gem 'guard-rspec'
end

# Pry is "advanced" IRB. I'm using it here as "rails console"
group :test, :development do
	gem 'pry'

  # Factory girl. For building "objects"
  gem 'factory_girl'
end
