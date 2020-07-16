class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end


# def self.locate_one(params)
#   if params[:name]
#     Item.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(1)
#   elsif params[:created_at]
#     Item.where("to_char(created_at,'yyyy-mon-dd-HH-MI-SS') ~ ?", "%#{params[:created_at]}%").limit(1)
#   elsif params[:updated_at]
#     Item.where('updated_at LIKE ?', "%#{params[:updated_at].strftime("%Y-%m-%d")}%").limit(1)
#   end
# end
#
# def self.locate_all(params)
#   Item.where('lower(name) LIKE ?', "%#{params[:name].downcase}%")
# end
