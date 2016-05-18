require 'shoulda-matchers'

RSpec.configure do |config|
  # config.include(Shoulda::Matchers::ActiveModel, type: :model)
  # config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    ## Choose one or more libraries:
    #with.library :active_record
    #with.library :active_model
  end
end