require 'pry'

class Item
  attr_reader :user_id, :drink, :size, :reg_decaf, :cream, :sugar, :reg_skim, :whip_nowhip, :flavor, :wet_dry
  
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
    end
    
  def insert(user_id) 
    sql_command="INSERT INTO items (drink, size, reg_decaf, cream, sugar, reg_skim, whip_nowhip, flavor, wet_dry) 
                  VALUES ('#{@drink}', '#{size}', '#{@reg_decaf}', '#{@cream}', '#{@sugar}', '#{@reg_skim}', '#{@whip_nowhip}', '#{@flavor}', '#{@wet_dry}')"

    DATABASE.execute(sql_command)
    @item_id = DATABASE.last_insert_row_id

    sql_command_pop_order_table = "INSERT INTO orders (item_id, user_id) VALUES (#{@item_id}, #{user_id})"
    DATABASE.execute(sql_command_pop_order_table)
  end

  def self.fetch_orders
    DATABASE.exectute("SELECT * FROM items")
  end
  #
  # def print orders  
  #
  # end
  end
  