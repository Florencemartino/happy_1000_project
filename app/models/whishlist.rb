class Whishlist < ApplicationRecord
  belongs_to :item
  belongs_to :event

  validates :quantity, presence: true
end
