FactoryBot.define do
  factory :deck_card do
    deck
    card
    count { 1 }
  end
end
