FactoryBot.define do
  factory :player do
    game
    user
    first_player { true }
  end
end
