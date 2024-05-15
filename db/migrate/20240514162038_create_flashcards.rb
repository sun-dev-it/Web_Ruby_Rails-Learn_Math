class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :kanji
      t.string :hiragana
      t.string :meaning

      t.timestamps
    end
  end
end
