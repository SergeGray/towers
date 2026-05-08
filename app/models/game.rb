class Game < ApplicationRecord
  enum :state, { pending: 0, in_progress: 1, finished: 2 }

  has_many :players, dependent: :destroy
  has_one :board, dependent: :destroy

  after_create :after_create_add_board

  private

  def after_create_add_board
    self.board = Board.create!(game: self)
  end
end
