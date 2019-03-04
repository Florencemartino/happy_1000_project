class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  has_many :baskets
  has_many :guests, dependent: :destroy
  has_many :whishlists, through: :baskets
  has_many :items, through: :whishlists

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
end
