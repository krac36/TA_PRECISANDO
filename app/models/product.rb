class Product < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['cars', 'clothes', 'furniture', 'art', 'tools', 'others']

  validates :description, :price, :name, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
