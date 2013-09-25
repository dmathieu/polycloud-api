class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer  :address_id
      t.string   :title

      t.timestamps
    end

    add_column :snippets, :language_id, :integer
  end
end
