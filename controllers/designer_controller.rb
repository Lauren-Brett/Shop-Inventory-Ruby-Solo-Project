require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/designer.rb')
require_relative('../models/product.rb')
also_reload('../models/*')



get '/designers' do
  @designers = Designer.all
  erb(:'designers/index')
end

get 'designers/new' do
  @designer = Designer.all
  erb(:'designers/new')
end

get '/designers/:id' do
  @designer = Designer.find(params[:id].to_i)
  erb(:'designers/show')
end

post '/designers/:id/create' do
  @designer = Designer.new(params)
  @designer.save()
  erb(:'designers/create')
end


get '/designers/:id/edit' do
  @designer = Designer.find(params['id'])
  erb(:'designers/edit')
end
