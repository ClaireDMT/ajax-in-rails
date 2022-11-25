class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant) } # trigger a new HTTP request
        format.json
      else
        format.html { render "restaurants/show", status: :unprocessable_entity } # sending HTML template
        format.json
      end
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content) #filter the form sent over
  end
end
