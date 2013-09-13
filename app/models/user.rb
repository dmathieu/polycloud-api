require 'bcrypt'

class User < ActiveRecord::Base

  belongs_to :address

  validates :email,              presence: true, uniqueness: {scope: [:address_id]}
  validates :encrypted_password, presence: true
  validates :token,              presence: true
  after_initialize :set_defaults

  attr_reader :password
  def password=(value)
    @password = value
    self.encrypted_password = password_digest(@password) if @password.present?
  end

  def valid_password?(password)
    return false if encrypted_password.blank?
    bcrypt   = ::BCrypt::Password.new(encrypted_password)
    password = ::BCrypt::Engine.hash_secret("#{password}#{Polycloud.pepper}", bcrypt.salt)
    Polycloud::Authentication.secure_compare(password, encrypted_password)
  end

  def refresh_token!
    self.update_column :token, generate_token
  end

  private
  def password_digest(password)
    ::BCrypt::Password.create("#{password}#{Polycloud.pepper}", cost: Polycloud.stretches).to_s
  end

  def set_defaults
    self.token = generate_token if token.blank?
  end

  def generate_token
    SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
  end
end
