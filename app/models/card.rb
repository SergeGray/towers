class Card < ApplicationRecord
  enum :action, { defense: 0, offense: 1, special: 2 }
  enum :rarity, { common: 0, rare: 1, effect: 2, unique: 3 }
  enum :faction, { neutral: 0,
                   militia: 1,
                   mc_club: 2,
                   leadership: 3,
                   chrome: 4,
                   merchants_guild: 5,
                   pirates: 6 }

  validates :name, :description, :strength, presence: true
  validates :strength, numericality: { greater_than_or_equal_to: 0 }

  has_many :deck_cards, dependent: :destroy
  has_many :decks, through: :deck_cards
end
