require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'
require 'omniauth-github'

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<YOUTUBE_API_KEY>") { ENV['YOUTUBE_API_KEY'] }
end


ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome

Capybara.configure do |config|
  config.default_max_wait_time = 5
end

SimpleCov.start "rails"

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

def stub_user_repo_api_requests
  stub_request(:get, "https://api.github.com/user/repos").
    to_return(body: File.read("./spec/fixtures/github_user_response.json"))
end

def stub_user_followers_api_requests
  stub_request(:get, "https://api.github.com/user/followers").
    to_return(body: File.read("./spec/fixtures/github_followers_response.json"))
end

def stub_user_following_api_requests
  stub_request(:get, "https://api.github.com/user/following").
    to_return(body: File.read("./spec/fixtures/github_following_response.json"))
end

def stub_github_public_user_api_requests
  stub_request(:get, "https://api.github.com/users/iandouglas").
    to_return(body: File.read("./spec/fixtures/github_public_user_response.json"))
end

def stub_github_private_user_api_requests
  stub_request(:get, "https://api.github.com/users/kate-v2").
    to_return(body: File.read("./spec/fixtures/github_private_user_response.json"))
end

def stub_github_no_user_api_requests
  stub_request(:get, "https://api.github.com/users/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxa").
    to_return(body: File.read("./spec/fixtures/github_no_user_response.json"))
end


  OmniAuth.config.test_mode = true


  omniauth_hash = {"provider"=>"github",
 "uid"=>"39295701",
 "info"=>
  {"nickname"=>"mnhollandplum",
   "email"=>nil,
   "name"=>"Nikki Holland-Plum",
   "image"=>
    "https://avatars1.githubusercontent.com/u/39295701?v=4",
   "urls"=>
    {"GitHub"=>"https://github.com/mnhollandplum",
     "Blog"=>""}},
 "credentials"=>
  {"token"=>"59f847d8350c1f696c6004e199eb0ff1cb090d16"}}.with_indifferent_access
  # omniauth_hash = { 'provider' => 'github',
  #
  #                   'uid' => '11111',
  #                   'info' => {
  #                       'name' => 'test',
  #                       'email' => 'test@email.com'
  #                   },
  #                   'credentials' => {
  #                     'token' => ENV['github_user_token'],
  #                     'username' => "test"
  #
  #                   }
  #
  #                 }.with_indifferent_access

  OmniAuth.config.add_mock(:github, omniauth_hash)

  # def stub_omniauth
  #   OmniAuth.config.test_mode = true
  #
  #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider" => "github","credentials" => {"token" => ENV['GITHUB_TOKEN']}})
  # end
