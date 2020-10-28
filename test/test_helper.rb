#test/test_helper.rb
require 'simplecov'

SimpleCov.start

require 'pokemon_tcg_sdk'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
end