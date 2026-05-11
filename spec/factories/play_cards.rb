FactoryBot.define do
  factory :play_card do
    player
    card

    trait :defensive do
      card { create(:card, action: :defense) }
    end

    trait :offensive do
      card { create(:card, action: :offense) }
    end
  end
end
