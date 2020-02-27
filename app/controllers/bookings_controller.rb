class BookingsController < ApplicationController
  before_action :find_dinner_id

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.dinner = @dinner
    @booking.user = current_user
    if @booking.save
      redirect_to dinner_path(@dinner)
    else
      render :new
    end
  end

  private

  def find_dinner_id
    @dinner = Dinner.find(params[:dinner_id])
  end
end
