class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :item
  before_action :move_to_signin
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item

      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:token, :postalcode, :prefecture_id,
                                          :town, :address, :building,
                                          :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in? && current_user.id != @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path if @item.order.present?
  end
end
