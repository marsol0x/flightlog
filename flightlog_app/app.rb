require 'sinatra'

# This is so Sinatra's built-in web server will listen outside
# of localhost. So to use the server through vagrant, we need this.
set :bind, '0.0.0.0' 

# Static location
set :public_folder, File.dirname(__FILE__) + '/static'
