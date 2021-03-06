class Event < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :whishlists, dependent: :destroy

  has_many :baskets, through: :whishlists
  has_many :users,   through: :guests
  # has_many :items, through: :whishlists

  validates :title, presence: true
  # validates :description, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
