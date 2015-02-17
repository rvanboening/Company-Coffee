require 'pry'
class User 
  attr_accessor :id, :user_name, :office_num, :order_num
  attr_reader :id, :user_name, :office_num, :order_num
  
  def initialize(options)
    @id         =options["id"].to_i
    @user_name  =options["user_name"]
    @office_num =options["office_num"]
    @order_num  =options["order_num"]
  end
  
  def insert
    attributes = []
    
    instance_variables.each do |i|
      #Ex :@user_name
      attributes << i.to_s.delete("@") 
      # Ex: :user_name
    end
    
    query_components_array=[]
    
    attributes.each do |a|
      value = self.send(a)
      
      if value.is_a?(Integer)
        query_components_array << "#{a} = #{value}"
      else
        query_components_array << "#{a} = '#{value}'"
      end
    end
    
    query_string = query_components_array.join(", ")
    
    # s="INSERT INTO users (user_name, office_num) VALUES (#{query_string})"
    # binding.pry
  
    DATABASE.execute(INSERT INTO users (user_name, office_num) VALUES ()
    @id=DATABASE.last_insert_row_id  
  end
end

binding.pry
  
  #
  #
  # def insert
  #   attributes = []
  #   instance_variables.each { |i|
  #     attributes << i.to_s.delete("@")
  #   }
  #
  #   query_components_array = []
  #   attributes.each { |x|
  #     value = self.send(x)
  #
  #     if value.is_a?(Integer)
  #       query_components_array << "#{value}"
  #     else
  #       query_components_array << "'#{value}'"
  #     end
  #   }
  #
  #   query_string = query_components_array.join(", ")
  #   puts query_string
  #
  #   o
  #   @id = DATABASE.last_insert_row_id
  #   puts "Inserted successfully!"
  # end