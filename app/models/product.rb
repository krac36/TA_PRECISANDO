class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  CATEGORIES = ['cars', 'clothes', 'furniture', 'art', 'tools', 'others']

  validates :description, :price, :name, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :photos, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
