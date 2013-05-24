require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'securerandom'

set :database, 'postgres://flightlog:flightlog@localhost/flightlog'

class User < ActiveRecord::Base
  include BCrypt

  has_many :session

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.email=(new_email)
    self.email = new_email.downcase
  end

  def self.authenticate(input_email, input_password)
    user = where(:email => input_email.downcase).first
    if not user
      return false
    end
    return Password.new(user.password_hash) == input_password
  end
end

class Session < ActiveRecord::Base
  belongs_to :user

  before_save :set_session

  def set_session
    @session ||= SecureRandom.hex(32)
    self.session_id = @session
  end
end
