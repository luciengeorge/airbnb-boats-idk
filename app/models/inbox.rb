class Inbox < ApplicationRecord
  has_one :user
  has_many :conversations
end
