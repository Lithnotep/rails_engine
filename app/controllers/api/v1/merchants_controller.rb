class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    merchant = Merchant.create(create_merchant_params)
    render json: MerchantSerializer.new(merchant)
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(create_merchant_params)
    merchant.save
    render json: MerchantSerializer.new(merchant)
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
    render json: MerchantSerializer.new(merchant)
  end

  private

  def create_merchant_params
    params.permit(:name)
  end
end
