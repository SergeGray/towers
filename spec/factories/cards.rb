FactoryBot.define do
  factory :card do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    action { :defense }
    rarity { :common }
    faction { :neutral }
    strength { 5 }
  end
end
