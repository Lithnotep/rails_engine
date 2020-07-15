require 'rails_helper'

describe "Merchant find API" do
  it "can get single Merchant via find" do
    merchant = create(:merchant, name: "Billy Booo")
    merchant2 = create(:merchant, name: "illy Nono")
    create_list(:merchant, 3)
    get "/api/v1/merchants/find?name=#{merchant.name.chop}"
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed["data"].count).to eq(1)
    expect(parsed["data"][0]["id"].to_i).to eq(merchant.id)
  end
end
