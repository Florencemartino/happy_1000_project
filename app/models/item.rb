class Item < ApplicationRecord
  has_many :whishlists

  validates :category, presence: true
  validates :name, presence: true
end
