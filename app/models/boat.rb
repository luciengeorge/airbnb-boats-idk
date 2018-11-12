class Boat < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :category, presence: true, inclusion: { in: ["Sail Boat", "Motorboat"] }
end
