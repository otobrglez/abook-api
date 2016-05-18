require_relative './boot.rb'
require 'rack/cors'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

ActiveRecord::Base.establish_connection ABOOK_ENV

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end

run API

