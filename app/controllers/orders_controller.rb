class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_signin

  

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
   
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:postalcode, :prefecture_id, 
                  :town, :address, :building, 
                  :phone_number).merge(user_id: current_user.id, item_id: @item.id )
  end

  def move_to_signin
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user.id != @item.user.id
        redirect_to new_user_session_path
      end
    end
    

end