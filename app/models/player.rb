class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  has_many :play_cards, dependent: :destroy
end
