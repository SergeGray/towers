class DiscardPile < ApplicationRecord
  belongs_to :player

  has_many :play_cards, as: :placeable, dependent: :destroy
  has_many :starting_game_turns, as: :originable, dependent: :destroy, class_name: "GameTurn"
  has_many :reaching_game_turns, as: :destinationable, dependent: :destroy, class_name: "GameTurn"
end
