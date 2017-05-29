class AddProyectIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :proyect_id, :integer
    add_index :comments, :proyect_id
  end
end
