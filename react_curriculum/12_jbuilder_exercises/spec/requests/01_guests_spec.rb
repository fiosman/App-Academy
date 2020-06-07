require 'rails_helper'

describe 'Guests' do
  describe 'Api::Guests#show' do
    it 'the resource is under the correct namespace' do
      get '/api/guests/1'
      expect(response).to be_success
    end

    it 'the show page shows correct information' do
      get '/api/guests/1'
      expect(json['name']).to eq('John Smith')
      expect(json['age']).to eq(45)
      expect(json['favorite_color']).to eq('Blue')
    end

    it 'the show page doesn\'t show too much information' do
      get '/api/guests/1'
      expect(json['created_at']).to be_nil
    end
  end

  describe 'Api::Guests#index' do
    it 'the resource is under the correct namespace' do
      get '/api/guests'
      expect(response).to be_success
    end

    it 'the index page shows multiple guests' do
      get '/api/guests'
      expect(json[0]['name']).to eq('John Smith')
      expect(json[1]['name']).to eq('Jane Doe')
    end

    it 'the index page doesn\'t show too much information' do
      get '/api/guests'
      expect(json[0]['created_at']).to be_nil
    end
  end

  describe 'Guests\' Gifts' do
    it 'show page shows a guest\'s gifts' do
      get '/api/guests/1'
      expect(json['gifts']).to_not be_nil
      expect(json['gifts'].count).to eq(2)
    end

    it 'index page doesn\'t show guests\' gifts' do
      get '/api/guests'
      expect(json[0]['gifts']).to be_nil
    end
  end
end
