require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')


# get '/designers/:id_designers' do
#   @products = Product.all(params['id_designers'].to_i)
#   erb(:'product/index')
# end
