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

    get '/apu/vi/merchants'
    expect(response).to be_successful
    merchant_json = JSON.parse(response.body)
    expect(merchant_json["data"]['id']).to eq(merchant.id)
  end
end
