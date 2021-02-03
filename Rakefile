require "bundler/gem_tasks"
require 'rake/testtask'
require_relative 'lib/pokemon_tcg_sdk'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

Pokemon.configure do |config|
  config.api_key = ENV['POKEMON_API_KEY']
end

task :card do
  card = Pokemon::Card.find('xy1-1')
  puts card.tcgplayer.updated_at
end