class ImportWords
  def initialize(word_enumerator)
    @word_enumerator = word_enumerator
  end

  def call
    ::WordEntry.bulk_insert do |bulk|
      each_word do |word|
        bulk.add(::WordEntry.new(word: word).attributes)
      end
    end
  end

  private

  def each_word
    @word_enumerator.each do |word|
      yield word.strip
    end
  end
end
