ENV["ABOOK_ENV"] = "test"

PROJECT_ROOT = File.expand_path('../..', __FILE__)
$LOAD_PATH << File.join(PROJECT_ROOT, './')

require 'boot.rb'
require 'rspec'


Dir[ABOOK_PATH.join('spec/support/**/*.rb')].each { |f| require f}

ActiveRecord::Base.establish_connection ABOOK_ENV

RSpec.configure do |config|
	config.expect_with :rspec do |expectations|
		expectations.include_chain_clauses_in_custom_matcher_descriptions = true
	end

	config.mock_with :rspec do |mocks|
		mocks.verify_partial_doubles = true
	end

	config.filter_run :focus
	config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

	if config.files_to_run.one?
		config.default_formatter = 'doc'
	end
end