class RentalsController < ApplicationController
  before_action :set_product

  def create
    @rental = Rental.new(rental_params)
    @rental.product = @product
    @rental.rentee = current_user
    if @rental.save
      redirect_to products_path, notice: "Product was successfully rented."
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
