DATABASE = SQLite3::Database.new("coffeering.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY,
                  drink TEXT, size TEXT, reg_decaf TEXT, cream TEXT,
                  sugar TEXT, reg_skim TEXT, whip_nowhip TEXT,
                  flavor TEXT, wet_dry TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, 
                  user_name TEXT, office_num INTEGER, order_num INTEGER)")