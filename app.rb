require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "cookbook"
require_relative "recipe"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end



get '/' do
  erb :index
end

get '/new' do
  erb :create_recipe
end

post '/recipes' do
  cookbook = Cookbook.new("recipes.csv")
  recipe = Recipe.new(params["name"], params["desc"], params["rating"], params["prep"])
  cookbook.add_recipe(recipe)
  redirect '/'
end
