require "sinatra"
require "sinatra/reloader" if development?
require 'sinatra/contrib'
require "tilt/erubis"

# GET / redirect to /lists
# GET /lists displays lists of todos
# GET /lists/new display form to add new list
# POST /lists/new add new list to session and redirect to /lists
# GET /lists/:list_id displays form to add new todo 
# POST /lists/:list_id add new todo to list and redirect to /lists/:list_id
# POST /lists/:list_id/complete complete all todos from list and redirect to /lists/:list_id
# POST /lists/:list_id/delete/:todo_id delete todo from list and redirect to /lists/:list_id
# POST /lists/:list_id/complete/:todo_id toggle complete todo from list and redirect to /lists/:list_id
# GET /lists/:list_id/edit displays form to edit list name
# POST /lists/:list_id/edit change name of list in database and redirect to /lists/:list_id
# POST /lists/:list_id/delete delete list from database and redirect to /lists

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
end

helpers do
  def each_todo_arranged(todos)
    todos.each_with_index do |todo, idx|
      yield todo, idx if !todo[:completed]
    end
    todos.each_with_index do |todo, idx|
      yield todo, idx if todo[:completed]
    end
  end

  def each_list_arranged(lists)
    lists.each_with_index do |list, idx|
      yield list, idx if !mark?(list)
    end
    lists.each_with_index do |list, idx|
      yield list, idx if mark?(list)
    end
  end
end

def todos_completed_ratio(list)
  not_done = list[:todos].count { |todo| !todo[:completed] }
  all = list[:todos].size
  "#{not_done}/#{all}"
end

def toggle_completed(list_id, todo_id)
  session[:lists][list_id][:todos][todo_id][:completed] = session[:lists][list_id][:todos][todo_id][:completed] ? false : true
end

def all_completed?(list)
  list[:todos].all? { |todo| todo[:completed] }
end

def mark?(list)
  all_completed?(list) && !list[:todos].empty?
end

def valid?(name)
  name.strip.size > 1 && name.strip.size < 100
end

def used?(list_name, lists)
  lists.map { |list| list[:name] }.include? list_name
end

# Redirect to Main Page
get "/" do
  redirect "/lists"
end

# Main Page, has
#
# link to New List form
# links to List Pages (if exist)
# 
# Display all lists of todos
get "/lists" do
  @lists = session[:lists]

  erb :lists
end

# New List form, has
#
# Form to make new list
get "/lists/new" do
  erb :new_list
end

# Route to add new list to database
#
# Redirect to Main Page
post "/lists/new" do
  @list_name = params[:list_name]
  if valid?(@list_name) && !used?(@list_name, session[:lists]) 
    session[:lists] << { name: @list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/"
  elsif used?(@list_name, session[:lists]) 
    session[:error] = "List name must be unique."
    erb :new_list
  else
    session[:error] = "List name must be between 1 and 100 characters"
    erb :new_list
  end
end

# List Page, has
#
# Link to Main Page
# Link to Complete all
# Link to Edit List
# Links to Mark Completed each todo
# Links to Delete each todo
#
# Display all todos from list
# Form to create new todo
get "/lists/:list_id" do |id|
  @list_id = id.to_i
  unless session[:lists][@list_id]
    session[:error] = "The specified list was not found."
    redirect "/lists"
  end
  @list = session[:lists][@list_id]

  erb :new_todo
end

# Route to add new todo to list database
#
# Redirect to List Page
post "/lists/:list_id" do |id|
  @list_id = id.to_i
  @list = session[:lists][@list_id]
  @todo_name = params[:todo_name]
  if valid?(@todo_name) 
    session[:lists][@list_id][:todos] << { name: @todo_name, completed: false }
    session[:success] = "The todo was added."
    redirect "/lists/#{@list_id}"
  else
    session[:error] = "Todo must be between 1 and 100 characters long."
    erb :new_todo
  end
end

# Route to mark all todos as completed in database
#
# Redirect to List Page
post "/lists/:list_id/complete" do |id|
  @list_id = id.to_i
  session[:lists][@list_id][:todos].each_with_index do |todo, idx|
    toggle_completed @list_id, idx unless todo[:completed]
  end
  session[:success] = "All todos have been completed."
  
  redirect "/lists/#{@list_id}"
end

# Route to delete todo from list database
#
# Redirect to List Page
post "/lists/:list_id/delete/:todo_id" do
  @todo_id = params[:todo_id].to_i
  @list_id = params[:list_id].to_i
  session[:lists][@list_id][:todos].delete_at @todo_id
  session[:success] = "The todo has been deleted."

  redirect "/lists/#{@list_id}"
end

# Route to toggle todo complete mark in database
#
# Redirect to List Page
post "/lists/:list_id/complete/:todo_id" do
  @todo_id = params[:todo_id].to_i
  @list_id = params[:list_id].to_i
  toggle_completed @list_id, @todo_id
  session[:success] = "The todo has been updated."
  
  redirect "/lists/#{@list_id}"
end

# Edit List page, has
#
# Link to Delete List
#
# Form to edit list name
get "/lists/:list_id/edit" do |id|
  @list_id = id.to_i
  @list_name = session[:lists][@list_id][:name]
  
  erb :edit_list
end

# Route to change list name in database
#
# Redirect to List Page
post "/lists/:list_id/edit" do |id|
  @list_id = id.to_i
  @list_name = params[:list_name]
  if valid?(@list_name) && !used?(@list_name, session[:lists])
    session[:lists][@list_id][:name] = @list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{@list_id}"
  elsif used?(@list_name, session[:lists]) 
    session[:error] = "List name must be unique."
    erb :edit_list
  else
    session[:error] = "List name must be between 1 and 100 characters."
    erb :edit_list
  end
end

# Route to delete list from database
#
# Redirect to Main Page
post "/lists/:list_id/delete" do |id|
  @list_id = id.to_i
  session[:lists].delete_at @list_id
  
  redirect "/lists"
end
