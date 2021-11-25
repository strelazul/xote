class RemoveEmailFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :eamial, :string
  end
end
