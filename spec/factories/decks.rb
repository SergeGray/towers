FactoryBot.define do
  factory :deck do
    name { FFaker::Lorem.word }
    user
  end
end
