require 'rails_helper'

describe "Merchant Business" do
  it "can find most revenue" do
    customer1 = create(:customer)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id, unit_price: 22.3)
    item2 = create(:item, merchant_id: merchant2.id, unit_price: 50.3)
    item3 = create(:item, merchant_id: merchant3.id, unit_price: 80.3)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer1.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id, customer_id: customer1.id)
    invoice4 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice_items1 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 2, unit_price: 22.3)
    invoice_items2 = create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 3, unit_price: 50.3)
    invoice_items3 = create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, quantity: 1, unit_price: 80.3)
    invoice_items4 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 2, unit_price: 22.3)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id)
    transaction4 = create(:transaction, invoice_id: invoice4.id)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][0][:attributes][:name]).to eq(merchant2.name)
  end
  it "can find most revenue" do
    customer1 = create(:customer)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id, unit_price: 22.3)
    item2 = create(:item, merchant_id: merchant2.id, unit_price: 50.3)
    item3 = create(:item, merchant_id: merchant2.id, unit_price: 80.3)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer1.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id, customer_id: customer1.id)
    invoice4 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice_items1 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 2, unit_price: 22.3)
    invoice_items2 = create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 3, unit_price: 50.3)
    invoice_items3 = create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, quantity: 1, unit_price: 80.3)
    invoice_items4 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 2, unit_price: 22.3)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id)
    transaction4 = create(:transaction, invoice_id: invoice4.id)


    get "/api/v1/merchants/most_items?quantity=2"
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:id].to_i).to eq(merchant1.id)


  end
end
