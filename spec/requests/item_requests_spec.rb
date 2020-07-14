require 'rails_helper'

describe "Items API" do
  it "can get a single item" do
    create(:item)

    get '/api/v1/items'

    expect(response).to be_successful
  end
  it "can get a list of Merchants" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items['data'].count).to eq(3)
  end
  it "can acquire a merchant by thier Id" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    expect(response).to be_successful
    item_json = JSON.parse(response.body)
    expect(item_json["data"]['id']).to eq("#{item.id}")
  end
end
