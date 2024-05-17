class Flashcard < ApplicationRecord
    validates :title, presence: true
    validates :romaji, presence: true
    before_save :set_default_flashcard
    def set_default_flashcard
        self.hiragana = "" if self.hiragana.nil?
        self.kanji = "" if self.kanji.nil?
        self.meaning = "" if self.meaning.nil?
        self.romaji = "" if self.romaji.nil?
    end
end
