class Faction < ApplicationRecord
  has_many :card_factions, dependent: :destroy
  has_many :cards, through: :card_factions

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
