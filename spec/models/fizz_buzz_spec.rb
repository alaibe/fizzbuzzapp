require 'rails_helper'

describe FizzBuzz do
  describe '.paginate' do
    subject { described_class.paginate(1, 10)}

    it 'returns a lazy enumerator' do
      expect(subject).to be_instance_of Enumerator::Lazy
    end

    it 'returns fizzbuzz from offset to limit' do
      expect(subject.first.offset).to be 1
      expect(subject.count).to be 10
    end
  end

  describe '.find' do
    subject { described_class.find(1)}

    it 'returns the fizbuzz for the offset' do
      expect(subject.offset).to be 1
    end
  end

  describe '.value' do
    subject { described_class.new(offset).value }

    context 'offset is modulo 15' do
      let(:offset) { 15 }

      it { is_expected.to be_eql 'FizzBuzz' }
    end

    context 'offset is modulo 5' do
      let(:offset) { 5 }

      it { is_expected.to be_eql 'Buzz' }
    end

    context 'offset is modulo 3' do
      let(:offset) { 3 }

      it { is_expected.to be_eql 'Fizz' }
    end

    context 'offset is not modulo 3 or 5' do
      let(:offset) { 2 }

      it { is_expected.to be_eql 2 }
    end
  end
end