require "rails_helper"

describe 'Anagram finder API' do
  include Rack::Test::Methods

  def app
    ::AnagramFinder::Application
  end

  before do
    create(:word_entry, word: 'pictures');
    create(:word_entry, word: 'piecrust');
    create(:word_entry, word: 'paste');
    create(:word_entry, word: 'peats');
    create(:word_entry, word: 'tapes');
  end

  context 'single query word' do
    it 'the response JSON object contains a single key' do
      get '/pictures'
      expect(last_response.status).to eq(200)
      result = JSON.parse(last_response.body)

      expect(result).to eq({
        'pictures' => ['piecrust']
      })
    end
  end

  context 'multiple query words' do
    it 'the response JSON object contains a key for each word' do
      get '/pictures,paste'
      expect(last_response.status).to eq(200)
      result = JSON.parse(last_response.body)

      expect(result).to eq({
        'pictures' => ['piecrust'],
        'paste' => ['peats', 'tapes']
      })
    end
  end
end
