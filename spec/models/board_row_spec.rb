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
end
