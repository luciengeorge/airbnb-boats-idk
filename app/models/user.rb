class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         :timeoutable
  has_many :boats
  has_many :reviews
  has_many :bookings
  belongs_to :inbox
  has_many :conversations, through: :inbox
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
