class CardFaction < ApplicationRecord
  belongs_to :card
  belongs_to :faction
end
