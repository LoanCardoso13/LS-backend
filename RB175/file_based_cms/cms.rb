require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "redcarpet"

def render_markdown(file_content)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(file_content)
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

get "/" do
  if session[:user]
    @files_array = Dir.glob(data_path + '/*').map { |path| File.basename(path) }

    erb :index
  else
    erb :signin
  end
end

get "/users/signin" do
  erb :signin
end

post "/users/signin" do
  if params[:username] == "admin" && params[:password] == "secret"
    session[:user] = "admin"
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    erb :signin
  end
end

post "/users/signout" do
  session[:user] = nil
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/new" do
  erb :new_file
end

post "/new" do
  file_name = params[:add]
  unless file_name.strip.empty?
    File.open(File.join(data_path, file_name), "w") 
    session[:message] = "#{file_name} was created."
    redirect "/"
  else
    session[:message] = "A name is required."
    erb :new_file
  end
end

get "/:file" do |file|
  path = data_path + "/#{file}"
  if File.file? path

    case file[-3..]
    when '.md'
      headers \
        "Content-Type" => "text/html"

      raw = File.read(path)
      render_markdown raw
    when 'txt'
      headers \
        "Content-Type" => "text/plain"

      File.read(path)
    end

  else
    session[:message] ="#{file} does not exist."
    redirect "/"
  end
end

get "/:file/edit" do |file|
  path = data_path + "/#{file}"
  @file = file
  @content = File.read(path)

  erb :edit
end

post "/:file/edit" do |file|
  session[:message] = "#{file} has been updated."
  path = data_path + "/#{file}"
  File.write(path, params[:content])
  
  redirect "/"
end

post "/:file/delete" do |file|
  session[:message] = "#{file} has been deleted."
  File.delete(File.join(data_path, file))

  redirect "/"
end
