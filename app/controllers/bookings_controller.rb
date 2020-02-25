class BookingsController < ApplicationController
  before_action :find_dinner_id
  def new
    @booking = Booking.new
  end

  def create
    # Booking.new(dinner_id: params[:dinner_id])
    Booking.new(booking_params)
  end

  private

  def find_dinner_id
    @dinner = Dinner.find(params[:dinner_id])
  end

  def booking_params
    params.require(:bookings).permit(:dinner_id)
  end
end
