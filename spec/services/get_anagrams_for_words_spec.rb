require 'rails_helper'

describe ::GetAnagramsForWords do
  it 'returns anagrams in a hash, excluding the given words' do
    create(:word_entry, word: 'pictures');
    create(:word_entry, word: 'piecrust');
    create(:word_entry, word: 'paste');
    create(:word_entry, word: 'peats');
    create(:word_entry, word: 'tapes');

    result = described_class.new(%w(pictures paste)).call

    expect(result).to eq({
      'pictures' => ['piecrust'],
      'paste' => ['peats', 'tapes']
    })
  end

  context 'if the query contains anagrams' do
    it 'returns the anagram for each query' do
      create(:word_entry, word: 'paste');
      create(:word_entry, word: 'peats');
      create(:word_entry, word: 'tapes');

      result = described_class.new(%w(paste peats)).call

      expect(result).to eq({
        'paste' => ['peats', 'tapes'],
        'peats' => ['paste', 'tapes']
      })
    end
  end
end
