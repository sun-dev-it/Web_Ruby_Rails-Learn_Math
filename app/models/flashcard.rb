class Flashcard < ApplicationRecord
    before_save :set_default_flashcard
    validates :title, presence: true
    validates :romaji, presence: true

    def set_default_flashcard
        self.hiragana = "" if self.hiragana.nil?
        self.romaji = "" if self.romaji.nil?
        self.kanji = "" if self.kanji.nil?
        self.meaning = "" if self.meaning.nil?
    end
end
