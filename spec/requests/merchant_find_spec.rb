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
  xit "can get single Merchant via find with created at" do
    merchant = create(:merchant, name: "Billy Booo", created_at: 'Mon, 16 May 2013 06:30:21 UTC +00:00')
    merchant2 = create(:merchant, name: "illy Nono")
    create_list(:merchant, 3)
    get "/api/v1/merchants/find?created_at=2013"
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed["data"].count).to eq(1)
    expect(parsed["data"][0]["id"].to_i).to eq(merchant.id)
  end
  xit "can get single Merchant via find with updated at" do
    merchant = create(:merchant, name: "Billy Booo", updated_at: 'Mon, 16 May 2013 06:30:21 UTC +00:00')
    merchant2 = create(:merchant, name: "illy Nono")
    create_list(:merchant, 3)
    get "/api/v1/merchants/find?updated_at=2013"
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed["data"].count).to eq(1)
    expect(parsed["data"][0]["id"].to_i).to eq(merchant.id)
  end
  it "can get single Merchant via find all" do
    merchant = create(:merchant, name: "Billy Booo")
    merchant2 = create(:merchant, name: "illy Nono")

    get "/api/v1/merchants/find_all?name=lly"
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed["data"].count).to eq(2)
  end
end
