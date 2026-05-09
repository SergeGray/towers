FactoryBot.define do
  factory :game_turn do
    game
    player
    targetable { create(:play_card, player: player) }
    originable { player.hand }
    locationable { game.game_rows.first }
  end
end
