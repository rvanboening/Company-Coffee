require 'sinatra'
require 'pry'
require 'SQLite3'

require_relative "database_setup.rb"
require_relative "models/users.rb"

get "/" do
  erb :homepage
end

get "/menu" do
  binding.pry
  
    DATABASE.execute "INSERT INTO users(user_name, office_num) VALUES (params['#{user_name}'], params['#{office_num}'])"
  erb :menu
end
