class Rental < ApplicationRecord
  belongs_to :product
  belongs_to :rentee, class_name: "User"

  validates :product, :rentee, presence: true
  validate :renter_and_rentee_must_be_different

  def renter
    product.user
  end

  def renter_and_rentee_must_be_different
    if renter == rentee
      errors.add(:rentee, "can't be same as renter.")
    end
  end
end
