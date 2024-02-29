class RemovePhotosColumnToProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :photos
  end
end
