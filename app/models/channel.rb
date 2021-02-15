class Channel < ApplicationRecord
  belongs_to :artist
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
