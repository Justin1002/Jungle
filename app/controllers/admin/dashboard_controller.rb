class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.count
    puts @product_count
    @categories_count = Category.all.count
    puts @categories_count
  end
end
