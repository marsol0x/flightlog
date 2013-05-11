require 'sinatra/base'
require 'haml'

require_relative 'login'

class FlightLog < Sinatra::Base
  use Login
  # This is so Sinatra's built-in web server will listen outside
  # of localhost. So to use the server through vagrant, we need this.
  set :bind, '0.0.0.0' 

  # Static location
  set :public_folder, File.dirname(__FILE__) + '/static'

  # HAML Settings
  set :haml, :format => :html5

  get '/' do
    haml :index, :locals => { :message => "A message!" }
  end

  run! if app_file == $0
end
