class Api::V1::Merchants::SearchController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.locate_one(permitted_params))
  end

  def index
    render json: MerchantSerializer.new(Merchant.locate_all(permitted_params))
  end

  private

  def permitted_params
    params.permit(:name, :created_at, :updated_at)
  end

end
