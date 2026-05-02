require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to define_enum_for(:action).with_values(defense: 0,
                                                           offense: 1,
                                                           special: 2) }
  it { is_expected.to define_enum_for(:rarity).with_values(common: 0,
                                                           rare: 1,
                                                           effect: 2,
                                                           unique: 3) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:strength) }
  it { is_expected.to validate_numericality_of(:strength).is_greater_than_or_equal_to(0) }

  it { is_expected.to have_many(:card_factions).dependent(:destroy) }
  it { is_expected.to have_many(:factions).through(:card_factions) }
  it { is_expected.to have_many(:deck_cards).dependent(:destroy) }
  it { is_expected.to have_many(:decks).through(:deck_cards) }
  it { is_expected.to have_many(:play_cards).dependent(:destroy) }
end
