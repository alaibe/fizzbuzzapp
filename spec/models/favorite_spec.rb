require 'rails_helper'

describe Favorite do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_numericality_of(:offset).only_integer.is_greater_than(0) }
end