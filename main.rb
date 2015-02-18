require 'sinatra'
require 'pry'
require 'SQLite3'

require_relative "database_setup.rb"
require_relative "models/users.rb"

get "/" do
  erb :homepage, :layout => :boilerplate
end

get "/menu" do
    DATABASE.execute("INSERT INTO users(user_name, office_num) VALUES ('#{params['user_name']}', '#{params['office_num']}')")
  erb :menu, :layout => :boilerplate
end

get "/coffee_page" do
  erb :coffee_page, :layout => :boilerplate
end

get "/mocha_page" do
  erb :mocha_page, :layout => :boilerplate
end

get "/success" do
  DATABASE.execute("INSERT INTO orders(drink, reg_decaf, size, cream, sugar, reg_skim, whip_nowhip, flavor, wet_dry) VALUES ('#{params['drink']}', '#{params['reg_decaf']}', '#{params['size']}', '#{params['cream']}', '#{params['sugar']}', '#{params['reg_skim']}', '#{params['whip_nowhip']}', '#{params['flavor']}', '#{params['wet_dry']}')")
  erb :success
end
