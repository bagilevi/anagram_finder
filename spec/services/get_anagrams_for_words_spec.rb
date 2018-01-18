require 'rails_helper'

describe ::GetAnagramsForWords do
  before do
    create(:word_entry, word: 'pictures');
    create(:word_entry, word: 'piecrust');
    create(:word_entry, word: 'paste');
    create(:word_entry, word: 'peats');
    create(:word_entry, word: 'tapes');
  end

  let(:result) { described_class.new(query_words).call }
  let(:query_words) { %w(pictures paste) }

  it 'returns anagrams in a hash, excluding the given words' do
    expect(result).to eq({
      'pictures' => ['piecrust'],
      'paste' => ['peats', 'tapes']
    })
  end

  context 'if the query words contain anagram pairs among themselves' do
    let(:query_words) { %w(paste peats) }

    it 'returns the anagram for each query' do
      expect(result).to eq({
        'paste' => ['peats', 'tapes'],
        'peats' => ['paste', 'tapes']
      })
    end
  end

  context 'if no anagram exists' do
    let(:query_words) { %w{none found}}

    it 'returns empty array for each input word' do
      expect(result).to eq({
        'none' => [],
        'found' => []
      })
    end
  end
end
