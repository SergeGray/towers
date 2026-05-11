class GameTurn < ApplicationRecord
  belongs_to :game
  belongs_to :player
  belongs_to :targetable, polymorphic: true
  belongs_to :originable, polymorphic: true
  belongs_to :destinationable, polymorphic: true
end
