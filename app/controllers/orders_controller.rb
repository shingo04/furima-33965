class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :conditions
  before_action :sold_out_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
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
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:item_price],
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
