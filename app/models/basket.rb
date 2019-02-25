class Basket < ApplicationRecord
  belongs_to :whishlist
  belongs_to :user
end
