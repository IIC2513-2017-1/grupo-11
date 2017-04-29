class CreateProyects < ActiveRecord::Migration[5.0]
  def change
    create_table :proyects do |t|
      t.string :name
      t.text :description
      t.date :initial_date
      t.date :due_date
      t.integer :actual_money
      t.integer :goal_money
      t.integer :score

      t.timestamps
    end
  end
end
