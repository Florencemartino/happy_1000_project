class Guest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
end
