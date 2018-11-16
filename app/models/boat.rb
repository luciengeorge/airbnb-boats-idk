class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  validates :category, presence: true, inclusion: { in: ["Sail Boat", "Motor Boat"] }
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :length, presence: true, numericality: { only_integer: true }
  validates :price_per_week, presence: true, numericality: { only_integer: true }
  validates :user, presence: true
  validates :available, presence: true
  accepts_nested_attributes_for :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch
  pg_search_scope :search_by_boat_info,
    against: [ :location, :capacity, :length, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
