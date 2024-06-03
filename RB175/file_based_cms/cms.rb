# rubocop:disable all
require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "redcarpet"
require "yaml"
require "bcrypt"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def create_document(name, content = "")
  File.open(File.join(data_path, name), "w") do |file|
    file.write(content)
  end
end

def render_markdown(markdown_text)
  Redcarpet::Markdown.new(Redcarpet::Render::HTML).render markdown_text
end

def auth(user, password)
  access_hsh = YAML.load_file('access_database.yml')
  BCrypt::Password.new(access_hsh[user]) == password
end

before do
  pattern = File.join(data_path, '*')
  @list = Dir.glob(pattern).map { |item| File.basename(item) }
end

get "/" do
  erb :index
end

post "/signin" do

  if auth(params[:user], params[:password])
    session[:signin] = true
    session[:user] = params[:user]
    session[:message] = "Welcome!"
  else
    session[:message] = "Invalid Credentials"
  end
  redirect "/"
end

get "/users/signin" do
  erb :signin, layout: :layout_2
end

post "/signout" do
  session[:signin] = false
  session[:user] = ""
  session[:message] = "You have signed out."

  redirect "/"
end

get "/:filename/view" do |file|
  unless @list.include? file
    session[:message] = "#{file} does not exist."
    redirect "/"
  end

  file_path = File.join(data_path, file)
  @content = File.read(file_path)

  if file[-3..] == '.md'
    [
      200,
      {"Content-Type" => "text/html"},
      [render_markdown(@content)]
    ]
  else
    [
      200,
      {"Content-Type" => "text/plain"},
      [@content]
    ]
  end
end

get "/:filename/edit" do |file|
  file_path = File.join(data_path, file)
  @content = File.read(file_path)

  erb :edit_file
end

post "/:filename/edit" do |file|
  if session[:signin]
    file_path = File.join(data_path, file)
    File.write(file_path, params[:changes])
    session[:message] = "#{file} has been updated."
  else
    session[:message] = "You must be signed in to do that."
  end
  redirect "/"
end

get "/new" do
  erb :new_file
end

post "/new_file" do
  if session[:signin]
    file = params[:filename].strip
    if file.empty?
      session[:message] = "A name is required."
      redirect "/new"
    end
    create_document file
    session[:message] = "#{file} was created."
  else
    session[:message] = "You must be signed in to do that."
  end
  redirect "/"
end

post "/:filename/delete" do |file|
  if session[:signin]
    file_path = File.join(data_path, file)
    File.delete(file_path)
    session[:message] = "#{file} has been deleted."
  else
    session[:message] = "You must be signed in to do that."
  end
  redirect "/"
end
