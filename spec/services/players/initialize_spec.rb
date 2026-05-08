require 'rails_helper'

RSpec.describe Players::Initialize do
  let(:game) { create(:game) }

  describe '.call' do
    let(:user) { create(:user) }
    let(:cards) { create_list(:card, Game::MINIMUM_CARDS_PER_DECK) }
    let(:card_ids) { cards.map(&:id) }

    context "with all correct parameters" do
      context "when the game has no players" do
        context "and first_player parameter has been provided" do
          let(:first_player) { true }

          it "initializes player, adds cards to play deck, selects player's as first_player parameter" do
            result = described_class.call(game:, card_ids:, user:, first_player:)

            expect(result).to be_success
            player = result.success
            expect(player.play_deck.play_cards.size).to eq(cards.size)
            expect(player.first_player).to eq(first_player)
          end
        end

        context "and first_player parameter has not been provided" do
          it "initializes player, adds cards to play deck, sets player's first_player parameter randomly" do
            instance = described_class.new(game:, card_ids:, user:)
            allow(instance).to receive(:random_boolean).and_return(false)

            result = instance.call

            expect(result).to be_success
            player = result.success
            expect(player.play_deck.play_cards.size).to eq(cards.size)
            expect(player.first_player).to eq(false)
          end
        end
      end

      context "when the game has one player" do
        it "initializes player, adds cards to play deck, sets new player's first_player to the opposite of existing one" do
          existing_player = create(:player, game: game)

          result = described_class.call(game:, card_ids:, user:)

          expect(result).to be_success
          player = result.success
          expect(player.play_deck.play_cards.size).to eq(cards.size)
          expect(player.first_player).to eq(!existing_player.first_player)
        end
      end
    end

    context "with incorrect parameters" do
      context "when not enough cards in the deck" do
        let(:cards) { create_list(:card, Game::MINIMUM_CARDS_PER_DECK - 1) }

        it "does not initialize player" do
          result = described_class.call(game:, card_ids:, user:)

          expect(result).to be_failure
          expect(result.failure).to eq("Not enough cards in a deck")
        end
      end

      context "when the game already has 2 players" do
        it "does not initialize player" do
          existing_players = create_list(:player, 2, game: game)

          result = described_class.call(game:, card_ids:, user:)

          expect(result).to be_failure
          expect(result.failure).to eq("Game already has 2 players")
        end
      end
    end
  end
end
