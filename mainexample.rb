require "sinatra"
require "prawn/labels"

get "/" do
  # Step 1. Have a collection of things to make labels for.
  orders = [
    {"user" => "Jordan", "drink" => "Mocha", "room" => "500"},
    {"user" => "Chris", "drink" => "Latte", "room" => "500"},
    {"user" => "Jon", "drink" => "Americano", "room" => "500"},
    {"user" => "Mike", "drink" => "Doppo Moahirano", "room" => "500"},
    {"user" => "Kelly", "drink" => "Coffee (Black)", "room" => "500"},
    {"user" => "Bob", "drink" => "Mocha", "room" => "500"},
    {"user" => "Greg", "drink" => "Cappuchino", "room" => "500"},
    {"user" => "Jordan", "drink" => "Mocha", "room" => "500"}
  ]
  
  filename = "orders-91.pdf"

  # Step 2. Loop through that collection.
  
  # The 'generate' method needs an array of information, where each item in
  # the array has stuff that'll go on a single label.
  
  Prawn::Labels.generate(filename, orders, :type => "Avery5160") do |pdf, o|
    
    # Step 3. For each item, create the string you want printed on each label.
    
    pdf.text "Order for: #{o["user"]}.\n#{o["drink"]}"
  end
  
  erb :homepage
end