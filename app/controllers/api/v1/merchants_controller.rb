class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    render json: Merchant.new(create_merchant_params).save
  end

  private

  def create_merchant_params
    params.permit(:name)
  end
end
