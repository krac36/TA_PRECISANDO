class Rental < ApplicationRecord
  belongs_to :product
  belongs_to :rentee, class_name: "User"


  validates :product, :rentee, presence: true
  validate :renter_and_rentee_must_be_different,
           :end_date_must_be_after_end_date,
           :start_date_must_be_after_current_date

  def renter
    product.user
  end

  private

  def renter_and_rentee_must_be_different
    if renter == rentee
      errors.add(:rentee, "can't be same as renter.")
    end
  end

  def end_date_must_be_after_end_date
    if (end_date - start_date).to_i <= 0
      errors.add(:end_date, "should be at least 1 day after start date.")
    end
  end

  def start_date_must_be_after_current_date
    if (start_date - Date.today).to_i < 0
      errors.add(:start_date, "must not be in the past.")
    end
  end
end
