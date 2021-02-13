class Artist < ApplicationRecord
  has_many :channels, dependent: :destroy
  has_many :fans, dependent: :destroy
  has_many :fan_users, through: :fans, source: :user
  
  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
