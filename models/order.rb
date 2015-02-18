require 'pry'

class Order 
  attr_reader :id, :drink, :size, :reg_decaf, :cream, :sugar, :reg_skim, :whip_nowhip, :flavor. :wet_dry
  
  def initialize(options)
      @id           =options["id"]
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
    
  def insert
  
  end
  
  end
  