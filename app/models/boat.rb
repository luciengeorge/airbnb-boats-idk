class Boat < ApplicationRecord
  belongs_to :user
  validates :category, presence: true, inclusion: { in: ["Sail Boat", "Motorboat"] }
end
