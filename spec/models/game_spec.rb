require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to define_enum_for(:state).with_values(pending: 0,
                                                         in_progress: 1,
                                                         finished: 2) }

  it { is_expected.to have_many(:players).dependent(:destroy) }
  it { is_expected.to have_many(:game_turns).dependent(:destroy) }
  it { is_expected.to have_one(:board).dependent(:destroy) }

  describe "callbacks" do
    it "creates a board on game creation" do
      game = build(:game)
      expect { game.save }.to change(Board, :count).by(1)
      expect(game.board).to be_persisted
    end
  end
end
