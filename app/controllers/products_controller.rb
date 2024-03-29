class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy blocked_dates]
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all

    if params[:query].present?
      @products = @products.global_search(params[:query])
    end
  end

  def show
    @rental = Rental.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def blocked_dates
    custom_response = @product.rentals.map do |rental|
      {
        start_date: rental.start_date,
        end_date: rental.end_date
      }
    end
    render json: custom_response
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :name, :category, photos: [])
  end
end
