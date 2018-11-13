class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :category, presence: true, inclusion: { in: ["Sail Boat", "Motor Boat"] }
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :length, presence: true, numericality: { only_integer: true }
  validates :price_per_week, presence: true, numericality: { only_integer: true }
  validates :user, presence: true
  validates :available, presence: true
  mount_uploaders :photos, PhotoUploader


  before_validation { self.previous_photos }
  before_save { self.add_previous_photos }

  def previous_photos
    binding.pry
    if self.photos
      @photos = self.photos
    end
  end

  def add_previous_photos
    if defined?(@photos)
      @photos.each do |a|
        if !self.photos.include?(a)
          self.photos << a
        end
      end
    end
  end
end
