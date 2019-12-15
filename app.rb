require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/product_controller')



get '/' do
  erb(:index)
end
