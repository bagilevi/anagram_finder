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
    group_for(word).map(&:word) - [word]
  end

  def group_for(word)
    groups[::WordEntry.canonicize(word)] || []
  end

  def groups
    @groups ||=
      ::WordEntry.anagrams_for_inclusive(@words)
        .group_by(&:canonical)
  end
end
