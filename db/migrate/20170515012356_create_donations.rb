class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :proyect_id

      t.timestamps
    end
  end
end
