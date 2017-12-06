require "bundler/gem_tasks"
require 'rake/testtask'
require_relative 'lib/pokemon_tcg_sdk'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :hashie do
  card = Pokemon::Card.find('xy1-1')
  puts card
  puts card.national_pokedex_number
end
