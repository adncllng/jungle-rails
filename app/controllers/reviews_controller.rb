class ReviewsController < ApplicationController
  before_filter :authorize

  def create
  product_id = params[:product_id]

  rating = Product.find(product_id).ratings.new(rating_params)
  rating.user= current_user
  rating.save
  redirect_to "/products/#{product_id}"
  end
  def destroy
    rating = Rating.find(params[:id])
    if rating.user == current_user
      rating.destroy
    end
    redirect_to "/products/#{params[:product_id]}"
  end

  private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end
end
