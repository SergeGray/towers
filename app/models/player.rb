class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  has_many :play_cards, dependent: :destroy
  has_one :hand, dependent: :destroy
  has_one :play_deck, dependent: :destroy
  has_one :discard_pile, dependent: :destroy
end
