require 'rails_helper'

RSpec.describe WordEntry, type: :model do
  it 'auto-generates a canonical value' do
    expect(described_class.new(word: 'dbca').canonical).to eq 'abcd'
  end

  it 'can find anagrams for a list of words' do
    create(:word_entry, word: 'pictures');
    create(:word_entry, word: 'piecrust');
    create(:word_entry, word: 'paste');
    create(:word_entry, word: 'peats');
    create(:word_entry, word: 'tapes');

    records = described_class.anagrams_for_inclusive(%w(pictures paste))
    anagrams = records.map(&:word)
    expect(anagrams).to contain_exactly *%w(pictures piecrust paste peats tapes)
  end
end
