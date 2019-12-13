require_relative('../db/sql_runner')

class Product

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @description = options['description']
  @buy_price = options['buy_price']
  @sell_price = options['sell_price']
end
end
