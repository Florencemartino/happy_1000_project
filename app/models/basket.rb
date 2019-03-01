class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user
  has_many :items, through: :whishlists
  has_one :event, through: :whishlist

  validates :quantity, presence: true
end
