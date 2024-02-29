class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :rentals do |t|
      t.references :product, null: false, foreign_key: true
      t.references :rentee, null: false, foreign_key: { to_table: 'users' }
      t.date :start_date
      t.date :end_data

      t.timestamps
    end
  end
end
