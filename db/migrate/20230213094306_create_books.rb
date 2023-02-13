class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :cover_image
      t.decimal :price

      t.timestamps
    end
  end
end
