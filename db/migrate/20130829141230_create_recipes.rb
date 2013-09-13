class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :title

      t.timestamps
    end

    create_table :recipes_steps do |t|
      t.integer  :recipe_id, index: true
      t.text     :content

      t.timestamps
    end

    create_table :recipes_ingredients do |t|
      t.integer  :recipe_id, index: true
      t.integer  :quantity
      t.string   :title

      t.timestamps
    end

    create_table :recipes_equipment do |t|
      t.integer  :recipe_id, index: true
      t.string   :title

      t.timestamps
    end
  end
end
