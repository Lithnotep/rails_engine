class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.locate_one(params)
    if params[:name]
      Merchant.where('name ILIKE ?', "%#{params[:name]}%").first
    elsif params[:created_at]
      Merchant.where("merchants.created_at, LIKE ?", "%#{params[:created_at]}%").limit(1)
    elsif params[:updated_at]
      Merchant.where('updated_at LIKE ?', "%#{params[:updated_at].strftime("%Y-%m-%d")}%").limit(1)
    end
  end

  def self.locate_all(params)
    Merchant.where('name ILIKE ?', "%#{params[:name]}%")
  end

  def self.revenue(param)
    list = Merchant.joins(invoices: [:invoice_items, :transactions])
            .where("transactions.result = 'success'")
            .group("merchants.name, merchants.id")
            .select("merchants.name, sum(invoice_items.quantity * invoice_items.unit_price) as revenue, merchants.id")
            .order("revenue desc")
            .limit(param)
    list.map {|merch|{ id: merch.id, name: merch.name, revenue: merch.revenue.round(2)}}
  end
end
