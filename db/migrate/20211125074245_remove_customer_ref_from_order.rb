class RemoveCustomerRefFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :customer, null: false, foreign_key: true
  end
end
