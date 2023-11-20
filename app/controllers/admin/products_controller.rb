class Admin::ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

  def authenticate
    expected_username = ENV['ADMIN_USERNAME']
    expected_password = ENV['ADMIN_PASSWORD']
    authenticate_or_request_with_http_basic do |username, password|
      username == expected_username && password == expected_password
    end
  end
end
