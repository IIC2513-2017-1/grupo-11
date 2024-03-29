class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :mail, null: false
      t.string :type

      t.timestamps
    end

    add_index :users, :mail, unique: true
    add_index :users, :username, unique: true

  end
end
