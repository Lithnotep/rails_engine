class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: { data: Merchant.most_items(params[:quantity])}
  end

end
