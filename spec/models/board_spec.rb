require 'rails_helper'

RSpec.describe Board, type: :model do
  it { is_expected.to belong_to(:game) }

  it { is_expected.to have_many(:board_rows).dependent(:destroy) }

  describe "callbacks" do
    it "creates 5 rows on creation" do
      board = create(:board)

      expect(board.board_rows.count).to eq(5)
      expect(board.board_rows.map(&:position)).to contain_exactly(0, 1, 2, 3, 4)
    end
  end
end
