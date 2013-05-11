require 'sinatra/base'
require 'haml'

class Login < Sinatra::Base
  set :haml, :format => :html5
  enable :sessions

  # Display login page
  get '/login' do
    haml :login
  end

  post '/login' do
    # Handle login tasks
    # This means that the login page points to itself to handle the task of logging in
  end
end
