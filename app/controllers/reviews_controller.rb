class ReviewsController < ApplicationController
  before_action :find_review, only: [:destroy]
  def create
    @review = Review.new(review_params)
    @review.boat = Boat.find(params[:boat_id])
    @review.user = current_user
    if @review.save
      redirect_to boat_path(@review.boat)
    else
      render 'boats/show'
    end
  end

  def destroy
    @boat = @review.boat
    @review.destroy
    redirect_to boat_path(@boat)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
