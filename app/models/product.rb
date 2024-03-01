class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  CATEGORIES = ['cars', 'clothes', 'furniture', 'art', 'tools', 'others']

  validates :description, :price, :name, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :photos, presence: true
end
