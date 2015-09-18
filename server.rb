require 'sinatra'

enable :sessions

get '/clear-everything' do
  erb :clear_everything
end

post '/clear-everything' do
  reset_session_and_users
  redirect '/clear-everything'
end

get '/' do
  @username = session[:username]
  erb :index
end

post '/sign-up' do
  session[:username] = params[:username]
  setup_users
  $users << params[:username]
  redirect '/my-account'
end

get '/my-account' do
  @username = session[:username]
  @users = $users
  erb :my_account
end

def setup_users
  $users ||= []
end

def reset_session_and_users
  $users = nil
  session[:username] = nil
end