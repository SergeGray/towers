FactoryBot.define do
  factory :game do
    state { :pending }
    first_player_turn { true }
  end
end
