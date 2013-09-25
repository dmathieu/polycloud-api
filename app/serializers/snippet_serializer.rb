class SnippetSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :language_id

end
