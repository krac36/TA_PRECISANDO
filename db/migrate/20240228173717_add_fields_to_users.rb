class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :fullname, :string
    add_column :users, :cpf, :string
  end
end
