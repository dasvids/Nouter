class Note < ApplicationRecord
  validates_presence_of :title, :text
end