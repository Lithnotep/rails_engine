class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    render json: Item.new(create_item_params).save
  end

  def update
    item = Item.find(params[:id])
    item.update(create_item_params)
    item.save
    render json: ItemSerializer.new(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: ItemSerializer.new(item)
  end

  private

  def create_item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
