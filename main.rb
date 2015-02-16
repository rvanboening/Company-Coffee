require 'pry'
require 'SQLite3'
DATABASE = SQLite3::Database.new("coffeering.db")

require_relative "views"
require_relative "Skeleton-2.0.4"

get "/" do
  erb :homepage
end



