class AddCategoryIdToProyect < ActiveRecord::Migration[5.0]
  def change
    add_column :proyects, :category_id, :integer
    add_index :proyects, :category_id
  end
end
