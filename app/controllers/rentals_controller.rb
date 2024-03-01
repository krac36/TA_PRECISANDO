class RentalsController < ApplicationController
  before_action :set_product

  def new
    if @product.user == current_user
      redirect_to products_path
    end
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.product = @product
    @rental.rentee = current_user
    if @rental.save
      redirect_to @product, notice: "Product was successfully rented."
    else
      render :new, status: :unprocessable_entity
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
