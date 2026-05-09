require 'rails_helper'

RSpec.describe Hand, type: :model do
  it { is_expected.to belong_to(:player) }
  it { is_expected.to have_many(:play_cards).dependent(:destroy) }
  it { is_expected.to have_many(:starting_game_turns).dependent(:destroy).class_name('GameTurn') }
  it { is_expected.to have_many(:reaching_game_turns).dependent(:destroy).class_name('GameTurn') }
end
