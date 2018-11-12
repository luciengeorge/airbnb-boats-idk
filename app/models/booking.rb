class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :user, presence: true
  validates :boat, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
