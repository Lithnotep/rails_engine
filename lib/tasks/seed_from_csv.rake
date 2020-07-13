namespace :csv_import do
  desc "Seed merchants.csv from db/data to database table"
  task mydata: :environment do
    require "csv"
    customers_text = CSV.read("db/data/customers.csv")
    customers = CSV.parse(customers_text, :headers => true)
    merchants_text = CSV.read("db/data/merchants.csv")
    merchants = CSV.parse(merchants_text, :headers => true)
    items_text = CSV.read("db/data/items.csv")
    items = CSV.parse(items_text, :headers => true)
    invoices_text = CSV.read("db/data/invoices.csv")
    invoices= CSV.parse(invoices_text, :headers => true)
    invoice_items_text = CSV.read("db/data/invoice_items.csv")
    invoice_items = CSV.parse(invoice_items_text, :headers => true)
    transactions_text = CSV.read("db/data/transactions.csv")
    transactions = CSV.parse(transactions_text, :headers => true)

    customers.each do |row|
      Customer.create!(row.to_hash)
    end

    merchants.each do |row|
      Merchant.create!(row.to_hash)
    end

    items.each do |row|
      Item.create!(row.to_hash)
    end

    invoices.each do |row|
      Invoice.create!(row.to_hash)
    end

    invoice_items.each do |row|
      Invoice_item.create!(row.to_hash)
    end

    transactions.each do |row|
      Transation.create!(row.to_hash)
    end
  end
end

# rails g model Customer name description unit_price:integer merchant:references
# rails g model Merchant name 
