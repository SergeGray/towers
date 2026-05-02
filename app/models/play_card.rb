class PlayCard < ApplicationRecord
  belongs_to :player
  belongs_to :card
  belongs_to :placeable, polymorphic: true
end
