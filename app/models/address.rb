class Address < ActiveRecord::Base

  has_many :users
  has_many :snippets

  validates :ip, uniqueness: true
end
