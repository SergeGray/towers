class BoardRow < ApplicationRecord
  belongs_to :board

  has_many :play_cards, as: :placeable, dependent: :destroy

  validates :position, presence: true,
                       uniqueness: { scope: :board_id },
                       numericality: { greater_than_or_equal_to: 0 }
end
