class Artist < ApplicationRecord
  has_many :channels, dependent: :destroy
  
  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
