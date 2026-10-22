class Note < ApplicationRecord
  validates :body, presence: true, length: { maximum: 500 }

  scope :recent, -> { order(created_at: :desc, id: :desc).limit(50) }
end
