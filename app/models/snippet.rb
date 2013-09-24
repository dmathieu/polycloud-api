class Snippet < ActiveRecord::Base

  belongs_to :address
  belongs_to :user

  validates :content, presence: true
  validates :user,    presence: true,
    if: lambda { address.authenticate? }
end
