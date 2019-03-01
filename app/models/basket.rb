class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user
  has_one :event, through: :whishlist

  validates :quantity, presence: true
end
