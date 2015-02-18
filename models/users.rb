require 'pry'
class User 
  attr_accessor :id, :user_name, :office_num, :order_num
  attr_reader :id, :user_name, :office_num, :order_num
  
  def initialize(options)
    @id         =options["id"]
    @user_name  =options["user_name"]
    @office_num =options["office_num"]
    @order_num  =options["order_num"]
  end
  
    
end 

