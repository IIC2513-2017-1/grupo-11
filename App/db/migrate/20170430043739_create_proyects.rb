class CreateProyects < ActiveRecord::Migration[5.0]
  def change
    create_table :proyects do |t|
      t.string :name, null: false
      t.text :description
      t.date :initial_date, null: false
      t.date :due_date, null: false
      t.integer :actual_money, null: false
      t.integer :goal_money, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
