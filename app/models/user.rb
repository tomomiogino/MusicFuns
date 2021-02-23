class User < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  with_options presence: true do
    validates :name, length: { maximum: 20 }
    validates :email, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    validates :password, length: { minimum: 6 }, on: :create
  end

  validates :password, length: { minimum: 6 }, allow_blank: true, on: :update
  validates :profile_comment, length: { maximum: 255 }

  before_validation { email.downcase! }
  has_secure_password

  mount_uploader :image, ImageUploader

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
