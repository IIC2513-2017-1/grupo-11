class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false
      t.date :comment_date

      t.timestamps
    end
  end
end
