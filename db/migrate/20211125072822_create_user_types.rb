class CreateUserTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_types do |t|
      t.string :user_type
      t.string :description
      t.integer :code

      t.timestamps
    end
  end
end
