class CreateNotes < ActiveRecord::Migration[6.1]
  def up
    create_table :notes do |t|
      t.string :title, null: false
      t.text :text
      t.timestamps
    end
  end

  def down
    drop_table :notes
  end
end
