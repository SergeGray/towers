FactoryBot.define do
  factory :board_row do
    board
    position { board.board_rows.count }
  end
end
