class WordEntry < ApplicationRecord
  # Entries that are an anagram of or the same as any of the words in the argument.
  # E.g: ab, cd => ab, ba, cd, da
  scope :anagrams_for_inclusive, ->(words) { where(canonical: words.map(&method(:canonicize))) }

  def word=(new_value)
    super
    self.canonical = self.class.canonicize(new_value)
  end

  def self.canonicize(word)
    word.split('').sort.join
  end
end
