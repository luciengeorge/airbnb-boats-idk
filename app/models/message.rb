class Message < ApplicationRecord
  belongs_to :conversation
  has_many :users, through: :conversation
end
