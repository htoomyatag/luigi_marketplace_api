class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :role_id
      t.string :author_pseudonym

      t.timestamps
    end
  end
end
