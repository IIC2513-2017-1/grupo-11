class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :proyect_id, null: false
      t.timestamps

      t.index :user_id
      t.index :proyect_id
    end
  end
end
