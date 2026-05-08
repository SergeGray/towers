class PlayCard < ApplicationRecord
  belongs_to :player
  belongs_to :card
  belongs_to :placeable, polymorphic: true

  before_validation :before_validation_add_to_deck

  private

  def before_validation_add_to_deck
    self.placeable ||= player.play_deck
  end
end
