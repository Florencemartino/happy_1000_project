class Whishlist < ApplicationRecord
  belongs_to :item
  belongs_to :event
  has_many :baskets, dependent: :destroy
  validates :quantity, presence: true
end
