require "bundler/gem_tasks"
require 'rake/testtask'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

Rake::TestTask.new do |t|
 t.libs << 'test'
end

desc "Run tests"
task :default => :spec

task :console do
  require 'pry'
  require 'awesome_print'
  require 'odyssey'
  AwesomePrint.pry!
  ARGV.clear
  Pry.start
end
