FactoryBot.define do
  factory :card do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    action { :defense }
    rarity { :common }
    faction { :neutral }
    strength { 5 }
  end
end
