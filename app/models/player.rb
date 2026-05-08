class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  has_many :play_cards, dependent: :destroy
  has_one :hand, dependent: :destroy
  has_one :play_deck, dependent: :destroy
  has_one :discard_pile, dependent: :destroy

  after_create :after_create_add_card_piles

  private

  def after_create_add_card_piles
    self.hand = Hand.create!(player: self)
    self.play_deck = PlayDeck.create!(player: self)
    self.discard_pile = DiscardPile.create!(player: self)
  end
end
