class BookingsController < ApplicationController
  def show
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    # raise
    if @booking.save
      redirect_to boat_booking_path(@booking.boat, @booking)
    else
      redirect_to boat_path(@booking.boat)
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
