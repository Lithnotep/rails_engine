namespace :csv_import do
  desc "Seed merchants.csv from db/data to database table"
  task mydata: ['db:drop', 'db:create', 'db:migrate'] do
    require "csv"
    CSV.foreach('db/data/customers.csv', headers: true) do |row|
      Customer.create!(row.to_hash)
    end
    puts "Created #{Customer.all.length} Customers"
    CSV.foreach('db/data/merchants.csv', headers: true) do |row|
      Merchant.create!(row.to_hash)
    end
    puts "Created #{Merchant.all.length} Merchants"
    CSV.foreach('db/data/items.csv', headers: true) do |row|
      store = row.to_hash
      store["unit_price"] = store["unit_price"].to_f/100
      Item.create!(store)
    end
    puts "Created #{Item.all.length} Items"
    CSV.foreach('db/data/invoices.csv', headers: true) do |row|
      Invoice.create!(row.to_hash)
    end
    puts "Created #{Invoice.all.length} Invoices"
    CSV.foreach('db/data/invoice_items.csv', headers: true) do |row|
      store = row.to_hash
      store["unit_price"] = store["unit_price"].to_f/100
      InvoiceItem.create!(store)
    end
    puts "Created #{InvoiceItem.all.length} Invoice Items"
    CSV.foreach('db/data/transactions.csv', headers: true) do |row|
      Transaction.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.tables.each do |t|
          ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
    puts "Created #{Transaction.all.length} Transactions"
    puts 'Successfully Seeded Database'
  end
end
