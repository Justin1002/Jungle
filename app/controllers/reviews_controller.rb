class ReviewsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    if @review.save
      redirect_to @product, notice: 'Review has been added'
    else
      redirect_to @product, notice: "Error review not saved"
    end
  end

    private

    def review_params
      params.require(:review).permit(:description, :rating).merge(user: current_user)
    end

end
