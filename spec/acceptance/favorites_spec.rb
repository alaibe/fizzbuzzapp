require 'rails_helper'

describe 'Favorites', type: :request do
  let(:name) { 'name' }
  let(:headers) { { 'Authorization' => "Token #{name}" } }

  before do
    post '/sessions', user: { name: name }
  end

  describe '#index' do
    it 'returns the favorites of the user' do
      get '/favorites', {}, headers

      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to be 0
    end
  end

  describe '#create' do
    context 'when offset is correct' do
      it 'creates the favorite' do
        post '/favorites', { favorite: { offset: 1 } }, headers

        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json['offset']).to be 1
      end
    end

    context 'when offset is not correct' do
      it 'creates the favorite' do
        post '/favorites', { favorite: { offset: -1 } }, headers

        json = JSON.parse(response.body)
        expect(response.status).to be 422
        expect(json['offset']).to be_instance_of Array
      end
    end
  end
end