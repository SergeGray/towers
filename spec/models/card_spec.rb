require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:strength) }
  it { is_expected.to validate_numericality_of(:strength).is_greater_than_or_equal_to(0) }

  it { is_expected.to have_many(:card_factions).dependent(:destroy) }
  it { is_expected.to have_many(:factions).through(:card_factions) }
  it { is_expected.to have_many(:deck_cards).dependent(:destroy) }
  it { is_expected.to have_many(:decks).through(:deck_cards) }
end
