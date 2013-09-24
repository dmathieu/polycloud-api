class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer  :address_id
      t.integer  :user_id
      t.text     :content

      t.timestamps
    end
  end
end
