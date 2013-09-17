class AddAddressAuthenticate < ActiveRecord::Migration
  def change
    add_column :addresses, :authenticate, :boolean, default: false
  end
end
