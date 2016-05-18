Pry.config.color = true

require_relative './boot.rb'

ActiveRecord::Base.establish_connection ABOOK_ENV