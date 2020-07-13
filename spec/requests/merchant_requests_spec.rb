require 'rails_helper'

describe "Merchants API" do
  it "sends a single Merchatn" do
    create(:merchant)

    get '/api/v1/merchants'

    expect(response).to be_successful
  end
end
