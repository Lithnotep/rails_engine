class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices

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
end
