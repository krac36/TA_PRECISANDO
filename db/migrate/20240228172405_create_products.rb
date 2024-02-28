class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :description
      t.float :price
      t.string :name
      t.string :photos
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
