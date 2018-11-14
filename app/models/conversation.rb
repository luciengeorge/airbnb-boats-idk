class Conversation < ApplicationRecord
  belongs_to :inbox
  has_many :users
  has_many :messages
end
