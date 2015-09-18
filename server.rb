require 'sinatra'

enable :sessions

get '/clear-session' do
  session[:name] = nil
  @name = session[:name]
  erb :session_cleared
end

get '/' do
  @name = session[:name]
  erb :index
end

post '/sign-up' do
  session[:name] = params[:name]
  $name = params[:name]
  redirect '/my-account'
end

get '/my-account' do
  @name = session[:name]
  @other_name = ""
  if $name
    @other_name = $name
  else
    @other_name = "No name set yet."
  end
  erb :my_account
end