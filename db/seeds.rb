require_relative( "../models/designer.rb")
require_relative( "../models/product.rb")

require("pry")

Product.delete_all()
Designer.delete_all()

designer1 = Designer.new({
  'name' => 'Romilly Design',
  'location' => 'Edinburgh, Scotland'
  # 'markup_return' => 50
  })

designer1.save()


designer2 = Designer.new({
    'name' => 'Caramel',
    'location' => 'London, England'
  })

designer2.save()


designer3 = Designer.new({
    'name' => 'Roam',
    'location' => 'Melrose, Scotland'
  })

designer3.save()


product1 = Product.new({
  'name' => 'Scarf',
  'description' => 'Cashmere',
  'stock_quantity' => 3,
  'buy_price' => 20,
  'sell_price' => 40,
  'designer_id' => designer1.id
  })
product1.save()

product2 = Product.new({
    'name' => 'Hat',
    'description' => 'Merino',
    'stock_quantity' => 2,
    'buy_price' => 10,
    'sell_price' => 20,
    'designer_id' => designer1.id
    })
product2.save()

product3 = Product.new({
      'name' => 'Jumper',
      'description' => 'Lambswool',
      'stock_quantity' => 4,
      'buy_price' => 50,
      'sell_price' => 80,
      'designer_id' => designer2.id
  })
product3.save()


product4 = Product.new({
        'name' => 'Jumper',
        'description' => 'Merino',
        'stock_quantity' => 2,
        'buy_price' => 60,
        'sell_price' => 100,
        'designer_id' => designer3.id
  })
product4.save()

binding.pry

products = Product.find_product(4)
