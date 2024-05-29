require "sinatra"
require "sinatra/reloader" if development?
require 'sinatra/contrib'
require "tilt/erubis"

# GET / redirect to /lists
# GET /lists displays lists of todos
# GET /lists/new display form to add new list
# POST /lists/new add new list to session and redirect to /lists
# GET /lists/:list_id displays form to add new todo 
# GET /lists/:list_id/edit displays form to edit list name
# POST /lists/:list_id add new todo to list and redirect to /lists/:list_id
# POST /lists/:list_id/delete/:todo_id delete todo from list and redirect to /lists/:list_id
# POST /lists/:list_id/complete/:todo_id toggle complete todo from list and redirect to /lists/:list_id

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

get "/lists" do
  @lists = session[:lists]

  erb :lists
end

get "/lists/new" do
  erb :new_list
end

post "/lists/new" do
  session[:lists] << { name: params[:list_name], todos: [] }

  redirect "/"
end

get "/lists/:list_id" do |id|
  @list_id = id.to_i
  @list_name = session[:lists][@list_id][:name]
  @todos = session[:lists][@list_id][:todos]

  erb :new_todo
end

get "lists/:list_id/edit" do |id|
  @list_id = id.to_i
  @list_name = session[:lists][@list_id][:name]
  @todos = session[:lists][@list_id][:todos]
  
  erb :edit_list
end

post "/lists/:list_id" do |id|
  @list_id = id.to_i
  session[:lists][@list_id][:todos] << { name: params[:todo_name], completed: false }

  redirect "/lists/#{@list_id}"
end

post "/lists/:list_id/delete/:todo_id" do
  @todo_id = params[:todo_id].to_i
  @list_id = params[:list_id].to_i
  session[:lists][@list_id][:todos].delete_at @todo_id

  redirect "/lists/#{@list_id}"
end
