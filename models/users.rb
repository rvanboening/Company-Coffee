class User 
  attr_accessor :user_id, :user_name, :office_num, :order_num
  attr_reader :user_id, :user_name, :office_num, :order_num
  
  def initialize(options)
    @user_id    =options["user_id"]
    @user_name  =options["user_name"]
    @office_num =options["office_num"]
  end
  
  # Take the current object and insert it as a new record into the users table
  def insert
    sql_command="INSERT INTO users (user_name, office_num) VALUES ('#{@user_name}', '#{@office_num}')"
    DATABASE.execute(sql_command)
    
    @user_id = DATABASE.last_insert_row_id
    # sql_command_pop_order_table = "INSERT INTO orders (user_id) VALUES ('#{@user_id}')"
#     DATABASE.execute(sql_command_pop_order_table)
  end
end


  # In terminal Type t = User.new ({"user_name" => 'Tom', "office_num" => '201'})
  # options has a () around them. Add them. 
  # "id" is a string. You must make them strings. 

  