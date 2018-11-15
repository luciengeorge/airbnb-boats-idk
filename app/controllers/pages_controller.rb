class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # Inbox.create!(title: "#{current_user.name}'s inbox", user: current_user) if current_user && current_user.inbox.nil?
  end

  def dashboard
    @bookings = current_user.bookings
  end

  def globe
    @boats = Boat.all
  end
end
