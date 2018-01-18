require 'rails_helper'

RSpec.describe WordEntry, type: :model do
  it 'auto-generates a canonical value' do
    expect(described_class.new(word: 'dbca').canonical).to eq 'abcd'
  end
end
