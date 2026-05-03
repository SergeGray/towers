FactoryBot.define do
  factory :play_card do
    player
    card
    placeable { create(:hand) }
  end
end
