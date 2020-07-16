class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: { data: Merchant.revenue(params[:quantity])}
  end

end
