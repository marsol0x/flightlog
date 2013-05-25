require 'sinatra/base'
require 'sinatra/cookies'
require 'haml'

require_relative 'login'
require_relative 'models/user'
require_relative 'models/session'

class FlightLog < Sinatra::Base
  helpers Sinatra::Cookies
  use Login
  # This is so Sinatra's built-in web server will listen outside
  # of localhost. So to use the server through vagrant, we need this.
  set :bind, '0.0.0.0' 

  # Static location
  set :public_folder, File.dirname(__FILE__) + '/static'

  # HAML Settings
  set :haml, :format => :html5

  # Make sure the user is logged in
  before do
    redirect '/login' unless cookies.has_key?("session_id") and ( not (s = Session.find_by_session_id(cookies[:session_id])).nil? and s.expires > DateTime.now)
  end

  get '/' do
    haml :index, :locals => { :message => User.find_by_id(Session.find_by_session_id(cookies[:session_id]).user_id).email }
  end

  run! if app_file == $0
end
