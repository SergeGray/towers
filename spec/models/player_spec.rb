require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:user).optional }

  it { is_expected.to have_many(:play_cards).dependent(:destroy) }
  it { is_expected.to have_one(:hand).dependent(:destroy) }
  it { is_expected.to have_one(:play_deck).dependent(:destroy) }
  it { is_expected.to have_one(:discard_pile).dependent(:destroy) }

  describe "callbacks" do
    it "creates play deck, hand, and discard pile on player create" do
      player = create(:player)

      expect(player.play_deck).to be_persisted
      expect(player.hand).to be_persisted
      expect(player.discard_pile).to be_persisted
    end
  end
end
