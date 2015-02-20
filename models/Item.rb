# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"

class Item
  attr_reader :user_id, :drink, :size, :reg_decaf, :cream, :sugar, :reg_skim, :whip_nowhip, :flavor, :wet_dry, :order_made
  
  def initialize(options)
      @item_id      =options["item_id"]
      @drink        =options["drink"]
      @size         =options["size"]
      @reg_decaf    =options["reg_decaf"]
      @cream        =options["cream"]
      @sugar        =options["sugar"]
      @reg_skim     =options["reg_skim"]
      @whip_nowhip  =options["whip_nowhip"]
      @flavor       =options["flavor"]
      @wet_dry      =options["wet_dry"]
      @order_made   =options["order_made"]
    end
    
  def insert(user_id) 
    sql_command="INSERT INTO items (drink, size, reg_decaf, cream, sugar, reg_skim, whip_nowhip, flavor, wet_dry, order_made) 
                  VALUES ('#{@drink}', '#{size}', '#{@reg_decaf}', '#{@cream}', '#{@sugar}', '#{@reg_skim}', '#{@whip_nowhip}', '#{@flavor}', '#{@wet_dry}', '#{order_made}')"

    DATABASE.execute(sql_command)
    @item_id = DATABASE.last_insert_row_id

    sql_command_pop_order_table = "INSERT INTO orders (item_id, user_id) VALUES (#{@item_id}, #{user_id})"
    DATABASE.execute(sql_command_pop_order_table)
  end

  # Public: #fetch_orders
  # Lists item id and name of a record
  #
  # Parameters:
  # id - Item ID
  #
  # Returns:
  # an arrary of hashes containing the item id and name
  #
  # State Changes: 
  # no changes
   
  # Lists all items for barista
  def self.fetch_all_orders
     DATABASE.execute("SELECT * FROM items")
  end
  
  def self.fetch_orders
     DATABASE.execute("SELECT * FROM items WHERE order_made = 'Order'")
  end
  
  def self.edit(made_item_id)
    DATABASE.execute("UPDATE items SET order_made='Made' WHERE item_id = '#{made_item_id}'")
  end
  
  def self.print(made_item_id)
    # This method = an array of hashes. 
    array_of_hashes = DATABASE.execute("SELECT * FROM items WHERE item_id = '#{made_item_id}'")
    # Because there is only one item in the array 0 will = the 1st hash inside the array. 
    h = array_of_hashes[0]
    # This selects the user id out of the hash. 
    u = h["user_id"]
    # This is fetching the user info from the user id that i got out of the array of hashes
    user_info = DATABASE.execute("SELECT * FROM users WHERE user_id = #{u}")
    
    
    ### DO THIS  ###  add user_id to my Items table. Acutally i need to make sure my item_user table is being updated so I can pull all the info out of those tbles using the Database.execute method. 
    
  end
  
end

  
