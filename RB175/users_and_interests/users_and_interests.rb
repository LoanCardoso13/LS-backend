# rubocop:disable all
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users_info = YAML.load_file('data/users.yaml')
  @users = @users_info.keys
end

helpers do
  def count_interests
    @users_info.values.map { |v| v[:interests] }.flatten.size
  end
end

get "/" do
  redirect "/list_users"
end

get "/list_users" do

  erb :list_users
end

get "/list_users/:user" do
  @user = params[:user].to_sym  
  @email = @users_info[@user][:email]
  @interests = @users_info[@user][:interests]

  erb :user
end
