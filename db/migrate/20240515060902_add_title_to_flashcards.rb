class AddTitleToFlashcards < ActiveRecord::Migration[7.0]
  def change
    add_column :flashcards, :title, :string
  end
end
