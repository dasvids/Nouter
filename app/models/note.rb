class Note < ApplicationRecord
  validates_presence_of :title, :text
  has_rich_text :text
end