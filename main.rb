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
  @user_id=params["user_id"]
  erb :mocha_page, :layout => :boilerplate
end

get "/success" do
  user_id=params["user_id"]
  @new_item=Item.new(params)
  @new_item.insert(user_id)
  erb :success, :layout => :boilerplate
end

get "/barista" do
   erb :barista, :layout => :boilerplate
end

#before refresh page
get "/barista_order_page" do
  made_item_id=params["item_id"]
  made_item = Item.edit(made_item_id)
  erb :barista_order_page, :layout => :boilerplate
end



