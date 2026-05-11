require 'rails_helper'

RSpec.describe BoardRow, type: :model do
  subject(:board_row) { create(:board_row) }

  it { is_expected.to belong_to(:board) }
  it { is_expected.to have_many(:play_cards).dependent(:destroy) }
  it { is_expected.to have_many(:starting_game_turns).dependent(:destroy).class_name('GameTurn') }
  it { is_expected.to have_many(:reaching_game_turns).dependent(:destroy).class_name('GameTurn') }
  it { is_expected.to have_many(:targeting_game_turns).dependent(:destroy).class_name('GameTurn') }

  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_uniqueness_of(:position).scoped_to(:board_id) }
  it { is_expected.to validate_numericality_of(:position).is_greater_than_or_equal_to(0) }

  describe "instance methods" do
    describe "#strength" do
      it "should return total strength of the tower in the row" do
        card_1 = create(:card, strength: 3, action: :defense)
        card_2 = create(:card, strength: 7, action: :defense)
        card_3 = create(:card, strength: 5, action: :offense)
        create(:play_card, card: card_1, placeable: board_row)
        create(:play_card, card: card_2, placeable: board_row)
        create(:play_card, card: card_3, placeable: board_row)

        expect(board_row.strength).to eq(5)
      end
    end

    describe "#controlling_player" do
      it "should return the player that started constructing the tower" do
        player = create(:player)
        play_card = create(:play_card, :defensive, player: player, placeable: board_row)

        expect(board_row.controlling_player).to eq(player)
      end
    end

    describe "#full?" do
      it "should tell that the row has reached its card limit" do
        create_list(:play_card, Game::CARDS_IN_ROW, placeable: board_row)

        expect(board_row.full?).to eq(true)
      end

      it "should tell that the row has not reached its card limit" do
        create_list(:play_card, (Game::CARDS_IN_ROW - 1), placeable: board_row)

        expect(board_row.full?).to eq(false)
      end
    end

    describe "#accepts?" do
      it "should return false if the row is full" do
        create_list(:play_card, (Game::CARDS_IN_ROW - 1), placeable: board_row)
        play_card = create(:play_card)

        expect(board_row.accepts?(play_card)).to eq(false)
      end

      context "when the card is offensive" do
        it "should return true if the row is controlled by opponent" do
          player_1 = create(:player)
          player_2 = create(:player)
          create(:play_card, :defensive, placeable: board_row, player: player_1)
          play_card = create(:play_card, :offensive, player: player_2)

          expect(board_row.accepts?(play_card)).to eq(true)
        end

        it "should return false if the row is controlled by player" do
          player = create(:player)
          create(:play_card, :defensive, placeable: board_row, player: player)
          play_card = create(:play_card, :offensive, player: player)

          expect(board_row.accepts?(play_card)).to eq(false)
        end

        it "should return false if the row is vacant" do
          play_card = create(:play_card, :offensive)

          expect(board_row.accepts?(play_card)).to eq(false)
        end
      end

      context "when the card is defensive" do
        it "should return true if the row is controlled by player" do
          player = create(:player)
          create(:play_card, :defensive, placeable: board_row, player: player)
          play_card = create(:play_card, :defensive, player: player)

          expect(board_row.accepts?(play_card)).to eq(true)
        end

        it "should return false if the row is controlled by opponent" do
          player_1 = create(:player)
          player_2 = create(:player)
          create(:play_card, :defensive, placeable: board_row, player: player_1)
          play_card = create(:play_card, :defensive, player: player_2)

          expect(board_row.accepts?(play_card)).to eq(false)
        end

        it "should return true if the row is vacant" do
          play_card = create(:play_card, :defensive)

          expect(board_row.accepts?(play_card)).to eq(true)
        end

        it "should return true if the row is controlled by opponent, but the strength is negative" do
          player_1 = create(:player)
          player_2 = create(:player)
          create(:play_card, :defensive, placeable: board_row, player: player_1)
          offensive_card = create(:card, action: :offense, strength: 7)
          create(:play_card, card: offensive_card, placeable: board_row)
          play_card = create(:play_card, :defensive, player: player_2)

          expect(board_row.accepts?(play_card)).to eq(true)
        end
      end
    end
  end
end
