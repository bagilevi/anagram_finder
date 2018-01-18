class GetAnagramsForWords
  def initialize(words)
    @words = words
  end

  def call
    @words.map do |word|
      [word, anagrams_for(word)]
    end.to_h
  end

  private

  def anagrams_for(word)
    groups[::WordEntry.canonicize(word)].map(&:word) - [word]
  end

  def groups
    @groups ||= ::WordEntry.anagrams_for(@words).group_by(&:canonical)
  end
end
