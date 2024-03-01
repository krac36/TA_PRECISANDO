class User < ApplicationRecord
  has_many :products
  has_many :rentals, foreign_key: "rentee_id"
  has_one_attached :photo

  validates :cpf, uniqueness: true
  validates :address, uniqueness: true
  validates :username, uniqueness: true, length: { in: 4..20 }
  validates :cpf, uniqueness: true, length: { is: 11 }, numericality: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

end
