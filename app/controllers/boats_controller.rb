class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_boat, only: [:show, :edit, :update]
  def index
    Inbox.create!(title: "#{current_user.name}'s inbox", user: current_user) if current_user && current_user.inbox.nil?
    if params[:location] && current_user
      # do search shit
      @boats = Boat.where("location LIKE '%#{params[:location]}%'").where.not(user: current_user)
      search_filter
    elsif current_user
      @boats = Boat.where.not(user: current_user)
      search_filter
    elsif params[:location]
      # do search shit
      @boats = Boat.where("location LIKE '%#{params[:location]}%'")
      search_filter
    else
      @boats = Boat.all
    end
  end

  def show
    Inbox.create!(title: "#{current_user.name}'s inbox", user: current_user) if current_user && current_user.inbox.nil?
    @review = Review.new
    @booking = Booking.new
    @markers =
      [{
        lng: @boat.longitude,
        lat: @boat.latitude
      }]
  end

  def new
    Inbox.create!(title: "#{current_user.name}'s inbox", user: current_user) if current_user && current_user.inbox.nil?
    @boat = Boat.new
    @photo = @boat.photos.build
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      params[:photos]['url'].each do |uri|
        @photo = @boat.photos.create!(url: uri)
      end
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

  def search_filter
    if params[:category].present? || params[:length].present? || params[:capacity].present?
      search = params[:location] + " " + params[:capacity] + " " + params[:length] + " " + params[:category]
      @boats = Boat.search_by_boat_info(search)
    end
  end

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :location, :capacity, :length, :price_per_week, :category, :available, photos_attributes: [:url, :id, :boat_id])
  end
end
