FactoryBot.define do
  factory :item do
    name { Faker::Games::Pokemon.name }
    description { Faker::Games::WorldOfWarcraft.quote }
    unit_price { Faker::Commerce.price } 
    merchant_id {create(:merchant).id}
  end
end
