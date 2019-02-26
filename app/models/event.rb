class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :items, through: :whishlists


  validates :title, presence: true
  # validates :description, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
