require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')


#index
get '/products' do
  @products = Product.all()
  erb(:'products/index')
end

#new, create, get back
get '/products/new' do
  @products = Product.all
  @designers = Designer.all
  erb(:'products/new')
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end




#show
get '/products/:id' do
  @product = Product.find(params[:id].to_i)
  erb(:'products/show')
end


#edit
get '/products/:id/edit' do
  @product = Product.find(params['id'])
  erb(:'products/edit')
end


#update, placement?
post '/products/:id' do
  Product.new(params).update
  redirect to('/products')
end


#delete
post '/products/:id/delete' do
  product = Product.find(params[:id])
  product.delete
  redirect to('/products')
end
