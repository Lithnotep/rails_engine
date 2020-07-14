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

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(create_merchant_params)
    merchant.save
    render json: MerchantSerializer.new(merchant)
  end

  private

  def create_merchant_params
    params.permit(:name)
  end
end
