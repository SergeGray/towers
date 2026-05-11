class BoardRow < ApplicationRecord
  belongs_to :board

  has_many :play_cards, as: :placeable, dependent: :destroy
  has_many :starting_game_turns, as: :originable, dependent: :destroy, class_name: "GameTurn"
  has_many :reaching_game_turns, as: :destinationable, dependent: :destroy, class_name: "GameTurn"
  has_many :targeting_game_turns, as: :targetable, dependent: :destroy, class_name: "GameTurn"

  validates :position, presence: true,
                       uniqueness: { scope: :board_id },
                       numericality: { greater_than_or_equal_to: 0 }

  def strength
    (defense_cards.sum("cards.strength") - offense_cards.sum("cards.strength"))
  end

  def controlling_player
    play_cards.joins(:card).where(card: { action: :defense }).first&.player
  end

  def accepts?(play_card)
    return false if full?

    if play_card.card.offense?
      controlling_player.present? && controlling_player != play_card.player
    elsif play_card.card.defense?
      controlling_player == play_card.player || strength <= 0
    else
      true
    end
  end

  def full?
    play_cards.size == Game::CARDS_IN_ROW
  end

  private

  def defense_cards
    play_cards.joins(:card).where(cards: { action: :defense })
  end

  def offense_cards
    play_cards.joins(:card).where(cards: { action: :offense })
  end
end
