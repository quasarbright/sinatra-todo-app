#Rakefile

require_relative "./myapp"
require "sinatra/activerecord/rake"
require 'securerandom'

namespace :db do
  task :load_config do
    require "./myapp"
  end
end

task :generate_secret do
  puts SecureRandom.hex(64)
end