require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:deck_cards).dependent(:destroy) }
  it { is_expected.to have_many(:cards).through(:deck_cards) }
end
