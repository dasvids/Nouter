class Note < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3}
  validates :text, presence: true, length: { minimum: 3}

  has_rich_text :text
  belongs_to :user
end