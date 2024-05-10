require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = 'Choose'
  @files = Dir.glob("public/*.png").map { |file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "desc"
  p params
  erb :home
end
