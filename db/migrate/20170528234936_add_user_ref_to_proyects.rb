class AddUserRefToProyects < ActiveRecord::Migration[5.0]
  def change
    add_reference :proyects, :user, foreign_key: true
    remove_column :proyects, :founder
  end
end
