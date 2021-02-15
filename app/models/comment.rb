class Comment < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :content, presence: true, length: { maximum: 300 }
end
