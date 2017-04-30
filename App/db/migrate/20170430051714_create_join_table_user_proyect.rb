class CreateJoinTableUserProyect < ActiveRecord::Migration[5.0]
  def change
    create_join_table :proyects, :users do |t|
      # t.index [:user_id, :proyect_id]
      # t.index [:proyect_id, :user_id]
    end
  end
end
