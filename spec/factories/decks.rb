FactoryBot.define do
  factory :deck do
    name { Faker::Lorem.word }
  end
end
