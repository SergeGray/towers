class PlayDeck < ApplicationRecord
  belongs_to :player

  has_many :play_cards, as: :placeable, dependent: :destroy
end
