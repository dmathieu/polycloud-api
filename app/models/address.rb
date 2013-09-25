class Address < ActiveRecord::Base

  has_many :users
  has_many :snippets
  has_many :languages

  validates :ip, uniqueness: true
end
