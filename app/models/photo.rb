class Photo < ApplicationRecord
  belongs_to :boat
  mount_uploader :url, PhotoUploader
end
