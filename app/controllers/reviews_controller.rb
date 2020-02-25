class ReviewsController < ApplicationController
  before_action :find_booking_id
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to dinner_path(@dinner)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:bookings).permit(:title, :comment, :rating)
  end

  def find_booking_id
    @review = Review.find(params[:booking_id])
  end
end
