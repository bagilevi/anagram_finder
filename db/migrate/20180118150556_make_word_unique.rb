class MakeWordUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :word_entries, :word, unique: true
  end
end
