require_relative('../db/sql_runner')

class Product

attr_reader :id
attr_accessor :name, :description, :stock_quantity, :buy_price, :sell_price, :designer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @designer_id = options['designer_id'].to_i
  end

#set up CRUD
#check if stock_quantity is possible like this

def save()
  sql = "INSERT INTO products (
  name,
  description,
  stock_quantity,
  buy_price,
  sell_price,
  designer_id
  ) VALUES (
    $1, $2, $3, $4, $5, $6
    ) RETURNING id;"
  values = [@name, @description, @stock_quantity, @buy_price, @sell_price, @designer_id]
  results = SqlRunner.run(sql, values)
  @id = results.first['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM products"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM products
    WHERE id =  $1;"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.map_items(data)
  return data.map { |product| Product.new(product)}
end


def self.all()
  sql = "SELECT * FROM products"
  results = SqlRunner.run(sql)
  return map_items(results)
end


def self.find(id)
  sql = "SELECT * FROM products
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  product = Product.new(result)
  return product
end


def update()
  sql = "UPDATE products
  SET (
    name,
    description,
    stock_quantity,
    buy_price,
    sell_price,
    designer_id
    ) = (
      $1, $2, $3, $4, $5, $6
      ) WHERE id = $7;"
  values = [@name, @description, @stock_quantity, @buy_price, @sell_price, @designer_id, @id]
  SqlRunner.run(sql, values)
end


def designer()
  designer = Designer.find(@designer_id)
  return designer
end

def product_details()
  return "#{@name.capitalize}, #{@description}"
end


def markup()
  return @sell_price - @buy_price
end

def total_stock_amount
  return @buy_price * @stock_quantity
end

# def add stock
#


# def low_stock()
#
#   if @stock_quantity < 2
#     return "low stock"
#   end
# end


#def designer_for_this_product end

#def stock_quantity end

#def buy_price to sell_price differnence e

#



end
