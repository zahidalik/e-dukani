class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(:product_params)

    if @product.save
      Product.sms_alert
      flash[:alert] = "Please check the sms send to your mobile number"
      redirect_to root_path
    else
      render 'new'
    end
  end
end