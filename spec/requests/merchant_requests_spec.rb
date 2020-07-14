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
  it "can create a merchant" do
    merchant = create(:merchant)
    expect(merchant.name).to_not eq("Billy")
    patch api_v1_merchants_path, params: { name: "Billy"}
    
    expect(response).to be_successful
    expect(merchant.name).to eq("Billy")
  end
end
