class AddRomajiToFlashcards < ActiveRecord::Migration[7.0]
  def change
    add_column :flashcards, :romaji, :string
  end
end
