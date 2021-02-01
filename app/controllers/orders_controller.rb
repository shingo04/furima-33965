class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :conditions

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?

      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def conditions
    redirect_to root_path if current_user.id == @item.user.id
  end

  def address_params
    params.require(:order_address).permit(:postal_code, :delivery_source_id, :cities, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
