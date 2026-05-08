class Board < ApplicationRecord
  belongs_to :game

  has_many :board_rows, dependent: :destroy

  after_create :after_create_add_board_rows

  private

  def after_create_add_board_rows
    5.times { |i| board_rows.create!(position: i) }
  end
end
