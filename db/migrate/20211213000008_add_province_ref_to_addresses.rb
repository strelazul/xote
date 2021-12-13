class AddProvinceRefToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :province, foreign_key: true
    add_column :addresses, :city, :string
  end
end
