class BookingsController < ApplicationController
  def index
    @boat = Boat.find(params[:boat_id])
    @bookings = @boat.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    if @booking.save
      redirect_to boat_path(@booking.boat)
    else
      render 'boats/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @boat = @booking.boat
    @booking.destroy
    redirect_to boat_path(@boat)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end
end
