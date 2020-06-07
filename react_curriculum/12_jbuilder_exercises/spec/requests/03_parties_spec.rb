require 'rails_helper'

describe 'Parties' do
  describe 'Api::Parties#show' do
    it 'the resource is under the correct namespace' do
      get '/api/parties/1'
      expect(response).to be_success
    end

    it 'the show page shows correct information' do
      get '/api/parties/1'
      expect(json['name']).to eq('Secret Santa Extravaganza')
    end

    it 'the show page doesn\'t show too much information' do
      get '/api/parties/1'
      expect(json['created_at']).to be_nil
    end

    it 'the show page shows a party\'s guests' do
      get '/api/parties/2'
      expect(json['guests'][0]['name']).to eq('Josh Brown')
      expect(json['guests'].count).to eq(2)
    end

    it 'the show page shows guests\' gifts' do
      get '/api/parties/2'
      expect(json['guests'][0]['gifts'][0]['title']).to eq('Baseball Glove')
      expect(json['guests'][0]['gifts'].count).to eq(2)
    end

    it 'the show page limits information about guests\' gifts' do
      get '/api/parties/2'
      expect(json['guests'][0]['gifts'][0]['created_at']).to be_nil
    end
  end

  describe 'Api::Parties#index' do
    it 'the resource is under the correct namespace' do
      get '/api/parties'
      expect(response).to be_success
    end

    it 'the index page shows multiple parties' do
      get '/api/parties'
      expect(json[0]['name']).to eq('Secret Santa Extravaganza')
      expect(json[1]['name']).to eq('Charles\' Christmas Party')
    end

    it 'the index page doesn\'t show too much information' do
      get '/api/parties'
      expect(json[0]['created_at']).to be_nil
    end
  end

  describe 'Parties && Gifts' do
    it 'show page shows a guest\'s gifts' do
      get '/api/parties/1'
      expect(json['guests'][0]['gifts']).to_not be_nil
      expect(json['guests'][0]['gifts'].count).to eq(2)
    end

    it 'index page doesn\'t show parties\' gifts' do
      get '/api/parties'
      expect(json[0]['gifts']).to be_nil
    end
  end
end
