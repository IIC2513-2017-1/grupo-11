class AddFounderToProyect < ActiveRecord::Migration[5.0]
  def change
    add_column :proyects, :founder, :string
  end
end
