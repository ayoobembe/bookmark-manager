#Remember environment variables from week 1?
ENV["RACK_ENV"]='test' #because we need to know which databse to work with
=begin 
This needs to be after ENV["RACK-ENV"]='TEST' 
because the server needs to know what environment it's running in i.e
test or development.
The environment determines what database to use
=end

require 'server'
require 'data_mapper'
require 'database_cleaner'
require 'capybara/rspec'
require 'sinatra'

Capybara.app = Sinatra::Application.new 

RSpec.configure do |config|

  config.before(:suite) do 
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do 
    DatabaseCleaner.start
  end

  config.after(:each) do 
    DatabaseCleaner.clean 
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end


