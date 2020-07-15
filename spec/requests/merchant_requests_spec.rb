require 'rails_helper'

describe "Merchants API" do
  it "can get single Merchant" do
    create(:merchant)

    get '/api/v1/merchants'

    expect(response).to be_successful
  end
  it "can get list of Merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    expect(merchants['data'].count).to eq(3)
  end
  it "can acquire a merchant by thier Id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"
    expect(response).to be_successful
    merchant_json = JSON.parse(response.body)
    expect(merchant_json["data"]['id']).to eq("#{merchant.id}")
  end
  it "can create a merchant" do
    post api_v1_merchants_path, params: { name: "Billy"}

    expect(response).to be_successful
    expect(Merchant.last.name).to eq("Billy")
  end
  it "can update a merchant" do
    merchant = create(:merchant)
    expect(merchant.name).to_not eq("Billy")
    patch api_v1_merchant_path(merchant), params: { name: "Billy"}
    merchant_changed = Merchant.find(merchant.id)
    expect(response).to be_successful
    expect(merchant_changed.name).to eq("Billy")
  end
  it "can delete a merchant" do
    merchant = create(:merchant)
    expect(Merchant.count).to eq(1)
    delete api_v1_merchant_path(merchant)

    expect(response).to be_successful

    expect(Merchant.count).to eq(0)
  end
  it "relationship endpoint between merchant and items" do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)
    item3 = create(:item, merchant_id: merchant.id)

    get api_v1_merchant_items_path(merchant)
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed["data"][0]["attributes"]["name"]).to eq(item1.name)
    expect(parsed["data"][1]["attributes"]["name"]).to eq(item2.name)
    expect(parsed["data"][2]["attributes"]["name"]).to eq(item3.name)
  end
end
