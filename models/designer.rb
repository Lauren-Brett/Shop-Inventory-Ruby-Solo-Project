require_relative('../db/sql_runner')

class Designer

attr_reader :id
attr_accessor :name, :location
# :markup_return


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
    # @markup_return = options['markup_return'].to_i
  end

  def save()
    sql = "INSERT INTO designers (
    name,
    location
    ) VALUES (
      $1, $2
      ) RETURNING id;"
      values = [@name, @location]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end


def self.delete_all()
  sql = "DELETE FROM designers"
  SqlRunner.run(sql)
end


# def delete()
#   sql = "DELETE FROM designers
#       WHERE id = $1;"
#   values = [@id]
#   SqlRunner.run(sql, values)
# end

def self.map_items(data)
  return data.map { |designer| Designer.new(designer)}
end

def self.all()
  sql = "SELECT * FROM designers"
  results = SqlRunner.run(sql)
  return map_items(results)
end


def self.find(id)
  sql = "SELECT * FROM designers
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  designer = Designer.new(result)
  return designer
end


def update()
  sql = "UPDATE designers
  SET (
    name,
    location
    ) =
    ( $1, $2
      ) WHERE id = $3;"
  values = [@name, @location, @id]
  SqlRunner.run(sql, values)
end

#
# def number_of_products()
#   sql = "SELECT products.* FROM products
#         INNER JOIN designers_products
#         ON designers.product_id = products.id
#         WHERE products.designer_id = $1"
#   values = [@id]
#   products_result = SqlRunner.run(sql, values)
#   return Product.map_items(products_result)
# end
# def list_products()
#   products = Product.find(@designer_id)
#   return products
# end




end
