class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card

  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
