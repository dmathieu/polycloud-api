class Address < ActiveRecord::Base

  has_many :users

  validates :ip, uniqueness: true
end
