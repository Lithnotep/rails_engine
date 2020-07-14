require 'rails_helper'

describe "Items API" do
  it "can get a single item" do
    create(:item)

    get '/api/v1/items'

    expect(response).to be_successful
  end
  it "can get a list of Items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items['data'].count).to eq(3)
  end
  it "can acquire an item by its Id" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    expect(response).to be_successful
    item_json = JSON.parse(response.body)
    expect(item_json["data"]['id']).to eq("#{item.id}")
  end
  it "can create an item" do
    merchant = create(:merchant)
    item_params = { name: Faker::Games::Pokemon.name ,
    description: Faker::Games::WorldOfWarcraft.quote,
    unit_price: Faker::Commerce.price,
    merchant_id: merchant.id}

    post api_v1_items_path, params: item_params
    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
  end
end
