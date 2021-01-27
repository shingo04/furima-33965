class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :item_status_id, :delivery_fee_id, :delivery_source_id, :delivery_date_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
