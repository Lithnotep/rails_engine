require 'rails_helper'

describe "Merchants API" do
  it "can get single Merchant" do
    merchant = create(:merchant)
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
  end
end
