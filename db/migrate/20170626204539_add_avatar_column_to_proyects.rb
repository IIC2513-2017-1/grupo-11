class AddAvatarColumnToProyects < ActiveRecord::Migration[5.0]
  def up
    add_attachment :proyects, :avatar
  end

  def down
    remove_attachment :proyects, :avatar
  end
end
