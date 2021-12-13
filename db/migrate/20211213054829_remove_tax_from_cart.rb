class RemoveTaxFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :tax, :decimal
  end
end
