class RemoveTextFromNotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :notes, :text
  end
end
