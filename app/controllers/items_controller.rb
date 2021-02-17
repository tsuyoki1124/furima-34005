class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :edit_move_to_index, only: :edit

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

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
  end

  def update
      if @item.update(item_params)
         redirect_to item_path(@item.id)
      else
         render :edit
      end
  end

  def destroy
    if current_user.id == @item.user.id
       @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :text, :prefecture_id, :condition_id, :category_id, :delivery_fee_id,
                                 :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def edit_move_to_index
    @item = Item.find(params[:id])
    if @item.order.present?
      redirect_to action: :index
    end
  end

end
