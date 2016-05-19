# We require our boot thing
require_relative './boot.rb'

# Rack CORS to enable CORS requests
require 'rack/cors'

# This thing is used here for better connection handling when running in "servers"
use ActiveRecord::ConnectionAdapters::ConnectionManagement

# Establish AR connection,...
ActiveRecord::Base.establish_connection ABOOK_ENV

# CORS configuration. NOT to be used for production, :)
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end

# Run the API
run API

