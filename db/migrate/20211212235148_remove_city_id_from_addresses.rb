class RemoveCityIdFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :addresses, :cities
    remove_column :addresses, :city_id, :integer
  end
end
