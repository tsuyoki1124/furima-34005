class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order(created_at: :desc)
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

  def delivery_fee
    @item = Item.find_by(delivery_fee_id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :text, :prefecture_id, :condition_id, :category_id, :delivery_fee_id,
                                 :estimated_shipping_date_id).merge(user_id: current_user.id)
  end


end
