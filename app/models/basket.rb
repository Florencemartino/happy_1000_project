class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user
  has_many :items, through: :whishlists

  validates :quantity, presence: true
end
