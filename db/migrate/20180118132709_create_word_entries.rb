class CreateWordEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :word_entries do |t|
      t.string :word, null: false
      t.string :canonical, null: false, index: true
    end
  end
end
