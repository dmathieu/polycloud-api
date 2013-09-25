class Snippet < ActiveRecord::Base

  belongs_to :address
  belongs_to :user
  belongs_to :language

  validates :content,  presence: true
  validates :user,     presence: true,
    if: lambda { address.authenticate? }
  validates :language, presence: true
end
