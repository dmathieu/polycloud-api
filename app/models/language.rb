class Language < ActiveRecord::Base

  belongs_to :address
  has_many   :snippets

  validates :title, presence: true
end
