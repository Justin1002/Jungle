class Admin::SalesController < ApplicationController
  
  http_basic_authenticate_with name:ENV["ADMIN_USER"], password: ENV["ADMIN_PASS"]

  def index
    @sales = Sale.all
    #render :index
  end

end
