class Note < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3}, uniqueness: true
  validates :text, presence: true, length: { minimum: 3}

  has_rich_text :text
  belongs_to :user
end