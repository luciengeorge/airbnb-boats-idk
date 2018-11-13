class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
  end

  private

  def photo_params
    params.require(:photo).permit(:url)
  end
end
