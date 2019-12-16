require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')


get '/products/:id_designer' do
  @products = Product.all(params['id_designers'].to_i)
  erb(:'products/index')
end

get '/products/:id' do
  @products = Product.find(params[:id].to_i)
  erb(:'products/show')
end
