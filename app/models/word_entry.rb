class WordEntry < ApplicationRecord
  scope :anagrams_for, ->(words) { where(canonical: words.map(&method(:canonicize))) }

  def word=(new_value)
    super
    self.canonical = self.class.canonicize(new_value)
  end

  def self.canonicize(word)
    word.split('').sort.join
  end
end
