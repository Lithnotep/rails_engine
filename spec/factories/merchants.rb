FactoryBot.define do
  factory :merchant do
    name { Faker::Games::Witcher.location }
  end
end
