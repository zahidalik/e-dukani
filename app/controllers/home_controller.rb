class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def welcome
    @user = current_user
    @products = Product.all.limit(3)
  end
end