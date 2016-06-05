require 'rails_helper'

describe 'Sessions', type: :request do
  context 'when the user does not exist' do
    it 'creates a new user' do
      name = 'name'
      post '/sessions', user: { name: name }

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['name']).to be_eql name
    end
  end

  context 'when the user exists' do
    it 'returns it' do
      name = 'name'
      post '/sessions', user: { name: name }
      first_id = JSON.parse(response.body)['id']

      post '/sessions', user: { name: name }
      second_id = JSON.parse(response.body)['id']

      expect(second_id).to be_eql first_id
    end
  end
end