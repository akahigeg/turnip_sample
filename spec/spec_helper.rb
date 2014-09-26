require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'turnip'
require 'turnip/capybara'

Dir.glob("spec/**/*steps.rb") { |f| load f, true }

Capybara.configure do |c|
  c.app_host = 'http://higelog.brassworks.jp'
  c.default_driver = :poltergeist
  c.javascript_driver = :poltergeist
  c.run_server = false
  c.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :js_errors => false, :timeout => 60)
  end
  c.run_server = false
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL
end
