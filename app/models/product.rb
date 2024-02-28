class Product < ApplicationRecord
  validates :description, :price, :name, :category, presence: true
  belongs_to :user
end
