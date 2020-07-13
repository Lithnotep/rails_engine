require 'rails_helper'

describe "Items API" do
  it "sends a single item" do
    create(:item)

    get '/api/v1/items'

    expect(response).to be_successful
  end
end
