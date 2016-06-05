require 'rails_helper'

describe User do
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#create_favorites' do
    let(:user) { User.create name: 'name' }

    subject { user.create_favorite(attributes) }

    context 'when attributes are valid' do
      let(:attributes) { { offset: 2 } }

      it 'creates a new favorite' do
        expect(subject.errors).to be_empty
        expect(subject).to be_persisted
      end
    end

    context 'when attributes are invalid' do
      let(:attributes) { { offset: -2 } }

      it 'returns a favorite with errors' do
        expect(subject.errors).to_not be_empty
        expect(subject).to_not be_persisted
      end
    end
  end
end