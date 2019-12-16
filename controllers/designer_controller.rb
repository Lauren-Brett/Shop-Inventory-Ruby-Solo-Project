require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')



get '/designers' do
  @designers = Designer.all
  erb(:'designer/index')
end

get 'designers/new' do
  @designer = Designer.all
  erb(:'designer/new')
end

get '/designers/:id' do
  @designer = Designer.find(params[:id].to_i)
  erb(:'designer/show')
end

post '/designers/:id/create' do
  @designer = Designer.new(params)
  @designer.save()
  erb(:'designer/create')
end


get '/designers/:id/edit' do
  @designer = Designer.find(params['id'])
  erb(:'designer/edit')
end
