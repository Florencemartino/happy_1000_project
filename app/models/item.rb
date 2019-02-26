class Item < ApplicationRecord
  has_many :whishlists

  validates :category, presence: true
  validates :name, presence: true
  # validates :icon, presence: true
end
