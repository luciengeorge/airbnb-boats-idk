class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_boat, only: [:show, :edit, :update]
  def index
    if params[:location]
      # do search shit
      @boats = Boat.where("location LIKE '%#{params[:location]}%'")
    else
      @boats = Boat.all
    end
  end

  def show
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
    @boat.photos.build
    # @photo = Photo.new
  end

  def create
    @boat = Boat.new(boat_params)
    # @photo = Photo.new()
    # @photo.boat = @boat
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    if @boat.save!
      redirect_to boat_path(@boat)
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :location, :capacity, :length, :price_per_week, :category, :available, photos_attributes: [:url])
  end

  # def photo_params
  #   params.require(:photo).permit(:url)
  # end
end
