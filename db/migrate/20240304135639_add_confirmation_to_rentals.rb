class AddConfirmationToRentals < ActiveRecord::Migration[7.1]
  def change
    add_column :rentals, :confirmed, :boolean
  end
end
