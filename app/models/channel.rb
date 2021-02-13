class Channel < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true, length: { maximum: 100 }
end
