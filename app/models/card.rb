class Card < ApplicationRecord
  enum type: { defense: 0, offense: 1, special: 2 }
  enum rarity: { common: 0, rare: 1, effect: 2, unique: 3 }
  enum faction: { none: 0,
                  militia: 1,
                  mc_club: 2,
                  leadership: 3,
                  chrome: 4,
                  merchants_guild: 5,
                  pirates: 6 }

  validates :name, :description, :strength, presence: true
  validates :strength, numericality: { greater_than: 0 }
end
