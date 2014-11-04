class Language < ActiveRecord::Base

  belongs_to :address
  has_many   :snippets, dependent: :destroy

  validates :title, presence: true
end
