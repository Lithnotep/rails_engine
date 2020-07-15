class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices

  def self.locate_one(params)
    if params[:name]
      Merchant.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(1)
    elsif params[:created_at]
      Merchant.where('created_at LIKE ?', "%#{params[:created_at]}%").limit(1)
    elsif params[:updated_at]
      Merchant.where('updated_at LIKE ?', "%#{params[:updated_at]}%").limit(1)
    end
  end
end
