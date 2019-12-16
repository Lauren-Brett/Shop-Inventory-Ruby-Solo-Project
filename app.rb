require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/product_controller')
require_relative('controllers/designer_controller')



# get '/' do
#   erb(:index)
# end

get '/designers' do
  @designers = Designer.all
  erb(:index)
end

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
