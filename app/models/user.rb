class User < ApplicationRecord
  # has_many :products
  validates :cpf, uniqueness: true
  validates :address, uniqueness: true
  validates :username, uniqueness: true, length: { in: 4..20 }
  validates :cpf, uniqueness: true, length: { is: 11 }, numericality: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
