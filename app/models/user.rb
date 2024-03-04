class User < ApplicationRecord
  has_many :products
  has_many :rentals, foreign_key: "rentee_id"
  has_many :products, dependent: :destroy
  has_many :rentals, foreign_key: :rentee_id, dependent: :destroy
  has_many :rented_products, through: :rentals, source: :product
  has_many :pending_rentals_as_owner, -> { where(confirmed: false) }, through: :products, source: :rentals
  has_many :accepted_rentals, -> { where(confirmed: true) }, through: :products, source: :rentals
  has_one_attached :photo

  validates :cpf, uniqueness: true
  validates :address, uniqueness: true
  validates :username, uniqueness: true, length: { in: 4..20 }
  validates :cpf, uniqueness: true, length: { is: 11 }, numericality: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  def pending_rentals
    rentals.where(confirmed: false)
  end

  def accepted_rentals
    rentals.where(confirmed: true)
  end

  def pending_rentals_as_owner
    rentals.where(confirmed: false)
  end



end
