require 'sinatra'
require 'pry'
require 'SQLite3'
require "prawn/labels"

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
  
  made_item = Item.edit(params["item_id"])
  order= Item.print(params["item_id"])
  
  # Step 1. Have a collection of things to make labels for.
  
  filename = "print_orders.pdf"

  # Step 2. Loop through that collection.

  # The 'generate' method needs an array of information, where each item in
  # the array has stuff that'll go on a single label.
  
  Prawn::Labels.generate(filename, order, user :type => "Avery5160") do |pdf, o, u|

  # Step 3. For each item, create the string you want printed on each label.
    pdf.text "Order for: #{o["item_id"]}.\n#{o["drink"]}.\n#{o["size"]}.\n#{o["reg_decaf"]}.\n#{o["cream"]}.\n
                          #{o["sugar"]}.\n#{o["reg_skim"]}.\n#{o["whip_nowhip"]}.\n#{o["flavor"]}.\n#{o["wet_dry"]}"
  end
  erb :barista_order_page, :layout => :boilerplate
end



