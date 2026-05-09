class BoardRow < ApplicationRecord
  belongs_to :board

  has_many :play_cards, as: :placeable, dependent: :destroy
  has_many :starting_game_turns, as: :originable, dependent: :destroy, class_name: "GameTurn"
  has_many :reaching_game_turns, as: :destinationable, dependent: :destroy, class_name: "GameTurn"
  has_many :targeting_game_turns, as: :targetable, dependent: :destroy, class_name: "GameTurn"

  validates :position, presence: true,
                       uniqueness: { scope: :board_id },
                       numericality: { greater_than_or_equal_to: 0 }
end
