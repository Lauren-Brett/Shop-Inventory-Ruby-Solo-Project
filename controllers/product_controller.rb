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


#new
# #fixxx
# get '/products/new' do
#     erb(:'products/new')
# end
#

#new, create, get back
get '/products/new' do
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

#create








#edit



#update



#delete
post '/products/:id/delete' do
  Product.delete(params[:id])
  redirect to('/products')
end
