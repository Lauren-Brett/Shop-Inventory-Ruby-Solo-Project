require_relative('../db/sql_runner')

class DesignerProduct

attr_reader :id
attr_accessor :designer_id, :product_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @designer_id = options['designer_id'].to_i
  @product_id = options['product_id'].to_i
end


def save()
  sql = "INSERT INTO designer_product (
  designer_id,
  product_id
  ) VALUES (
    $1, $2
    ) RETURNING *"
  values = [@designer_id, @product_id]
  result = SqlRunner.run(sql, values).first
  @id = result['id'].to_i
  @id
end


def self.all()
  sql = "SELECT * FROM designer_product"
  result = SqlRunner.run(sql)
  return result.map { |item| DesignerProduct.new(item)}
end

end
