class User < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 20 }
    validates :email, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    validates :password, length: { minimum: 6 }, on: :create
  end

  validates :profile_comment, length: { maximum: 255 }

  before_validation { email.downcase! }
  has_secure_password

  mount_uploader :image, ImageUploader
end
