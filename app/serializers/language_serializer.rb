class LanguageSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title
  has_many :snippets
end
