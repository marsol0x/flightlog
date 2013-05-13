require 'sinatra/base'
require 'sinatra/cookies'
require 'haml'

require_relative 'models'

class Login < Sinatra::Base
  helpers Sinatra::Cookies
  set :haml, :format => :html5

  # Display login page
  get '/login' do
    locals = {}
    if request.referrer and request.referrer.split('/')[-1] == 'login'
        locals[:error] = true
    end
    haml :login, :locals => locals
  end

  post '/login' do
#    session = Session.where(:id => 2).first
#    cookies[:session_id] = session.session_id
    if User.authenticate(params[:email], params[:password])
      user = User.where(:email => params[:email]).first
      session = user.session.new
      session.expires = 24.hours.from_now
      session.save!
      cookies[:session_id] = session.session_id
      redirect '/'
    else
      redirect '/login'
    end
  end

end
