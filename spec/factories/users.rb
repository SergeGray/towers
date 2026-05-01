FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8, 16) }

    trait :with_deck do
      after(:create) do |user|
        create(:deck, user: user)
      end
    end
  end
end
