class Card < ApplicationRecord
  enum :action, { defense: 0, offense: 1, special: 2 }
  enum :rarity, { common: 0, rare: 1, effect: 2, unique: 3 }

  has_many :card_factions, dependent: :destroy
  has_many :factions, through: :card_factions

  has_many :deck_cards, dependent: :destroy
  has_many :decks, through: :deck_cards

  has_many :play_cards, dependent: :destroy

  validates :name, :description, :strength, presence: true
  validates :strength, numericality: { greater_than_or_equal_to: 0 }
end
