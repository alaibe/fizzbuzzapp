require 'rails_helper'

describe 'FizzBuzzs', type: :request do
  describe '#index' do
    it 'returns the list of fizzbuzzs' do
      get '/'

      expect(response).to be_success
      expect(response.body).to include 'data'
      expect(response.body).to include '100'
      expect(response.body).to_not include '101'
    end
  end

  describe '#show' do
    it 'shows the fizzbuzz' do
      get '/fizz_buzzs/15'

      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['offset']).to be 15
      expect(json['value']).to be_eql 'FizzBuzz'
    end
  end
end