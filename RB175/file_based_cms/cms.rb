require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "redcarpet"

def render_markdown(file_content)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(file_content)
end

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

root = File.expand_path("..", __FILE__)

get "/" do
  @files_array = Dir.glob(root + '/data/*').map { |path| File.basename(path) }

  erb :index
end

get "/:file" do |file|
  path = root + "/data/#{file}"
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
  path = root + "/data/#{file}"
  @file = file
  @content = File.read(path)

  erb :edit
end

post "/:file/edit" do |file|
  session[:message] = "#{file} has been updated."
  path = root + "/data/#{file}"
  File.write(path, params[:content])
  
  redirect "/"
end
