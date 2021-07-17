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
    @product = Product.new(product_params)

    if @product.save
      @product.sms_alert
      flash[:notice] = "Please check the sms send to your mobile number"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:item_name, :price, :available, :description)
  end
end