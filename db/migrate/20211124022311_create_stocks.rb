class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.date :made_on
      t.integer :durable_life
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
