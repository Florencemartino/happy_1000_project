class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user

  validates :quantity, presence: true
end
