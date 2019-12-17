require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')


#index
get '/designers' do
  @designers = Designer.all
  erb(:'designers/index')
end

#new, create, get back
get '/designers/new' do
  
  erb(:'designers/new')
end

post '/designers' do
  @designer = Designer.new(params)
  @designer.save()
  redirect to '/designers'
end

#show
get '/designers/:id' do
  @designer = Designer.find(params['id'].to_i)
  @products = @designer.find_product()
  # @designer = Designer.find_product(params['designer_id'].to_i)
  erb(:'designers/show')
end

#create
# post '/designers/:id/create' do
#   @designer = Designer.new(params)
#   @designer.save()
#   erb(:'designers/create')
# end


#edit
get '/designers/:id/edit' do
  @designer = Designer.find(params['id'])
  erb(:'designers/edit')
end




#delete
post '/designers/:id/delete' do

  Designer.destroy(params[:id])
  redirect to('/designers')
end



#update
post '/designers/:id' do
  Designer.new(params).update
  redirect to('/designers')
end




# get '/designers/:id/products' do
#   @products = Product.find(params['designer_id'])
#   erb(:'designers/show')
# end


# display a designer with all of their products
