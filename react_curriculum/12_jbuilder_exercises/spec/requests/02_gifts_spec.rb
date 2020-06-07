require 'rails_helper'

describe 'Gifts' do
  describe 'Api::Gifts#show' do
    it 'the resource is under the correct namespace' do
      get '/api/gifts/3'
      expect(response).to be_success
    end

    it 'the show page shows correct information' do
      get '/api/gifts/3'
      expect(json['title']).to eq('The Hunger Games')
      expect(json['description']).to eq('A bit dark for a gift, but it\'s good.')
    end

    it 'the show page doesn\'t too much information' do
      get '/api/gifts/3'
      expect(json['created_at']).to be_nil
      expect(json['guest_id']).to be_nil
    end
  end

  describe 'Api::Gifts#index' do
    it 'the resource is under the correct namespace' do
      get '/api/guests/3/gifts'
      expect(response).to be_success
    end

    it 'the index page shows multiple gifts' do
      get '/api/guests/3/gifts'
      expect(json[0]['title']).to eq('Baseball Glove')
      expect(json[1]['title']).to eq('Basketball Tickets')
    end

    it 'a nested index page shows the correct gifts' do
      get '/api/guests/3/gifts'
      expect(json.count).to eq(2)
    end

    it 'the index page doesn\'t show too much information' do
      get '/api/guests/3/gifts'
      expect(json[0]['created_at']).to be_nil
    end
  end
end
