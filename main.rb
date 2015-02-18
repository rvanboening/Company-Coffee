require 'sinatra'
require 'pry'
require 'SQLite3'

require_relative "database_setup.rb"
require_relative "models/users.rb"
require_relative "models/item.rb"

get "/" do
  erb :homepage, :layout => :boilerplate
end

get "/menu" do
  @user=User.new(params)
  @user.insert
  erb :menu, :layout => :boilerplate
end

get "/coffee_page" do
  @user_id=params["user_id"]
  erb :coffee_page, :layout => :boilerplate
end

get "/mocha_page" do
  erb :mocha_page, :layout => :boilerplate
end

get "/success" do
  user_id=params["user_id"]
  @new_item=Item.new(params)
  @new_item.insert(user_id)
  
  # DATABASE.execute("INSERT INTO items(drink, reg_decaf, size, cream, sugar, reg_skim, whip_nowhip, flavor, wet_dry)
  #                   VALUES ('#{params['drink']}', '#{params['reg_decaf']}', '#{params['size']}',
  #                   '#{params['cream']}', '#{params['sugar']}', '#{params['reg_skim']}',
  #                   '#{params['whip_nowhip']}', '#{params['flavor']}', '#{params['wet_dry']}')")
  #
  erb :success, :layout => :boilerplate
end
