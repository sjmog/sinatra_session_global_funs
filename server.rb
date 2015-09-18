require 'sinatra'

enable :sessions

get '/clear-all' do
  session[:name] = nil
  $names = []
  @name = session[:name]
  erb :session_cleared
end

get '/' do
  @name = session[:name]
  erb :index
end

post '/sign-up' do
  session[:name] = params[:name]
  $names << params[:name]
  redirect '/my-account'
end

get '/my-account' do
  @name = session[:name]
  if $names
    @other_names = $names
  else
    @other_names = []
  end
  erb :my_account
end