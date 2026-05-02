class Board < ApplicationRecord
  belongs_to :game

  has_many :board_rows, dependent: :destroy
end
