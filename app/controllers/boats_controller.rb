class BoatsController < ApplicationController
  before_action :find_boat, only: [:show, :edit, :update]
  def index
    @boats = Boat.all
  end

  def show
    @review = Review.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
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
    if @boat.save
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
    params.require(:boat).permit(:name, :description, :location, :capacity, :length, :price_per_week, :type)
  end
end
