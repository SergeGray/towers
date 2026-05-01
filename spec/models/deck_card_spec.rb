require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  it { is_expected.to belong_to(:deck) }
  it { is_expected.to belong_to(:card) }
  it { is_expected.to validate_presence_of(:count) }
  it { is_expected.to validate_numericality_of(:count).is_greater_than_or_equal_to(0) }
end
