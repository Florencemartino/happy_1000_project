class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :is_coming, presence: true
end
