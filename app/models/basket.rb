class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user

  validates :price_in_cent, presence: true
  validates :quantity, presence: true
end
