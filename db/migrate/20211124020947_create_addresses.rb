class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :line01
      t.string :line02
      t.string :postal_code
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
