require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'

class Session < ActiveRecord::Base
  belongs_to :user

  before_save :set_session

  def set_session
    @session ||= SecureRandom.hex(32)
    self.session_id = @session
  end
end

