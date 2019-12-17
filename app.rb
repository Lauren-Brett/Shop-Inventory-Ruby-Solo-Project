require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/products_controller')
require_relative('controllers/designers_controller')



get '/' do
  erb(:index)
end

# get '/designers' do
#   @designers = Designer.all
#   erb(:'/designers/index')
# end

# get '/designers/new' do
#     erb(:new)
# end
#
# get '/designers/:id' do
#   @designer = Designer.find(params[:id].to_i)
#   erb(:show)
# end
#
#
# post '/designers' do
#   @designer = Designer.new(params)
#   @designer.save()
#   erb(:create)
# end
