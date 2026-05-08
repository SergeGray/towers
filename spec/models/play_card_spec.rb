require 'rails_helper'

RSpec.describe PlayCard, type: :model do
  subject(:play_card) { create(:play_card) }

  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:card) }

  describe "callbacks" do
    it "places card in the play deck if it has no placeable" do
      player = create(:player)
      play_card = create(:play_card, player: player, placeable: nil)

      expect(play_card.placeable).to eq(player.play_deck)
    end

    it "doesn't place card in the play deck if it has a placeable" do
      player = create(:player)
      play_card = create(:play_card, player: player, placeable: player.hand)

      expect(play_card.placeable).to eq(player.hand)
    end
  end
end
