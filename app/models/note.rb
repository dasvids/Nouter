class Note < ApplicationRecord
  validates_presence_of :title
  has_rich_text :text

  belongs_to :user
end