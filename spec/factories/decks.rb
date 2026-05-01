FactoryBot.define do
  factory :deck do
    name { FFaker::Lorem.word }
  end
end
