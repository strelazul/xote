class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birthday
      t.string :eamial

      t.timestamps
    end
  end
end
