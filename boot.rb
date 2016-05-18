ENV["RACK_ENV"] ||= ENV["ABOOK_ENV"] ||= 'development'
ENV["RAILS_ENV"] = ENV["RACK_ENV"]


ABOOK_ENV = ENV["RACK_ENV"].to_sym

# Ruby standard lib dependencies
require 'bundler'
require 'erb'
require 'yaml'

# Setup bundler to load only whats needed
Bundler.setup(:default, ABOOK_ENV)

# Set this for better and easier path management
require 'pathname'
ABOOK_PATH = Pathname.pwd

# Require the magical Grape framework
require 'grape'
require 'grape-swagger'

# Lets use active_support to make our life a bit easier
require 'active_record'
require 'active_support'
require 'hashie-forbidden_attributes'


# This are path for dependencies. Auto-loading simplifies life. :)
ActiveSupport::Dependencies.autoload_paths += %W{
#{ABOOK_PATH.join('app')}
#{ABOOK_PATH.join('app/models')}
}

# ActiveRecord configuration
ActiveRecord::Base.configurations = YAML.load(
    ERB.new(
        File.read(
            ABOOK_PATH.join('./config/database.yml'))).result)

# You want some logger here. So.. and that.

if ABOOK_ENV != :test
  ActiveRecord::Base.logger = Logger.new(STDOUT)
# ActiveSupport::Logger.new(STDOUT)
end