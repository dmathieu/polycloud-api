class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string   :ip

      t.timestamps
    end

    add_column :users, :address_id, :integer
  end
end
