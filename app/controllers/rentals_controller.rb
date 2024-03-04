class RentalsController < ApplicationController
  before_action :set_product, only: :create

  def create
    @rental = Rental.new(rental_params)
    @rental.product = @product
    @rental.rentee = current_user
    @rental.confirmed = false
    if @rental.save
      redirect_to products_path, notice: "Rental Request successfuly sent, please await owner approval."
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(confirmed: true)
    redirect_to profile_path(current_user), notice: "Rental request has been confirmed."
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to profile_path(current_user), notice: "Rental request has been rejected."
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
